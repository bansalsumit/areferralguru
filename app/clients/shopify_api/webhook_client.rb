# frozen_string_literal: true

module ShopifyApi class WebhooksClient  
  class CreateFailed < StandardError; end
  
  def initialize(client = nil)
    @client = client 
  end
  
  def all
    response = client.get_request("webhooks")
  
    build_shopify_webhooks(response[:webhooks]) 
  end
  
  def create(params) 
    response = client.create_request("webhooks", params) 

    webhook_hash = webhook_hash(response)
    build_shopify_webhook(webhook_hash)
  end
  
  def destroy(id)
    client.delete_request("webhooks", id) 
  end
  
  def self.build_params(topic:, address :) 
    { 
      webhook: {
        topic: topic, 
        address: format(address, host: Settings.callback_host),
        format: "json", }, 
    } 
  end
  
  private
  
  attr_reader :client
  
  def webhook_hash(response)
    response.fetch(:webhook)
  end

  def build_shopify_wehbhook(response_hash)
    Resourcess::Webhook.build(response_hash)
  end

  def build_shopify_webhooks(webhooks)
    webhooks.map { |webhook_attributes| build_shopify_webhook(webhook_attributes) }
  end
end