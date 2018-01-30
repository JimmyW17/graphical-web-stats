var AllItems = createReactClass({
    getInitialState() {
        return { items: [] }
    },
    componentDidMount() {
        $.getJSON('webpages.json'), (response) => { this.setState({ items: response}) }
    },

    render() {
        var items = this.state.items.map((item) => {
            return (
                <div key={item.uuid}>
                    <h3>{item.domain}</h3>
                    <p>{item.url}</p>
                </div>
            )
        });

        return(
            <div>
                {items}
            </div>
        )
    }
})