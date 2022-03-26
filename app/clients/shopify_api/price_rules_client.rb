module ShopifyApi
  class PriceRulesClient

    def initialize(client)
      @client = client
    end

    def get_all(query_params: {})
      response = client.get_request("customers", query_params: query_params)
    end

    def get_count
      response = client.get_request("customers/count")
      response["count"]
    end

    def create
      client.create_request('/price_rules', price_rules_data)
    end


    def price_rules_data
      {
        price_rule: {
          title: "15OFFCOLLECTION",
          target_type: "line_item",
          target_selection: "entitled",
          allocation_method: "across",
          value_type: "percentage",
          value: "-15.0",
          customer_selection: "all",
          entitled_collection_ids: [292322640032],
          starts_at: Time.now.iso8601,
          once_per_customer: true
        },
        type: 'JSON'
      }
    end
    
    private
    attr_reader :client
  end
end