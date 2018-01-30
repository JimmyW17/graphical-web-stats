class WebpageController < ApplicationController
  require 'open-uri'

  def show
    @webpage = Webpage.friendly.find(params[:id])
    @source = @webpage.page_source.try(:html)
  end

  def check
    if uri?(params[:url])
      @webpage = Webpage.find_by url: params[:url]
      if @webpage
        @webpage.increment!(:checked_count)
        add_history_and_source
        redirect_to webpage_path(@webpage)
      else
        url = params[:url]
        uri = Addressable::URI.parse(params[:url])
        protocol = uri.normalized_scheme
        resource = uri.normalized_host
        domain = get_domain(resource)
        @webpage = Webpage.create(
          url: url,
          protocol: protocol,
          resource: resource,
          domain: domain
        )
        add_history_and_source
        redirect_to webpage_path(@webpage)
      end
    else
      flash[:notice] = "#{params[:url]} is not a valid web address."
      redirect_to root_path
    end
  end

  def webpages
    @webpages = Webpage.all
    
    respond_to do |format|
      format.json { render json: @@webpages }
    end
  end

  private

  def uri?(string)
    uri = URI.parse(string)
    %w( http https ).include?(uri.scheme)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end
  
  def get_domain(resource)
    resource.start_with?('www.') ? resource[4..-1] : resource
  end

  def add_history_and_source
    page_history = @webpage.page_histories.create
    html = Nokogiri::HTML(open(@webpage.url, 'User-Agent' => 'graphical-web-stats'))
    page_history.create_page_source(html: html)
  end

end
