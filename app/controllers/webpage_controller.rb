class WebpageController < ApplicationController
  require 'open-uri'

  def show
    @webpage = Webpage.find(params[:id])
  end

  def check
    if uri?(params[:url])
      @webpage = Webpage.find_by url: params[:url]
      if @webpage
        @webpage.increment!(:checked_count)
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
        redirect_to webpage_path(@webpage)
      end
    else
      flash[:notice] = "#{params[:url]} is not a valid web address."
      redirect_to root_path
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

end
