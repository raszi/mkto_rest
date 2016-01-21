require 'mrkt/version'
require 'mrkt/errors'

require 'mrkt/concerns/connection'
require 'mrkt/concerns/authentication'
require 'mrkt/concerns/activities'
require 'mrkt/concerns/opportunities'
require 'mrkt/concerns/paging_token'
require 'mrkt/concerns/crud_helpers'
require 'mrkt/concerns/crud_campaigns'
require 'mrkt/concerns/crud_leads'
require 'mrkt/concerns/crud_lists'
require 'mrkt/concerns/import_leads'

module Mrkt
  class Client
    include Connection
    include Authentication
    include Activities
    include PagingToken
    include CrudHelpers
    include CrudCampaigns
    include CrudLeads
    include CrudLists
    include ImportLeads
    include Opportunities

    attr_accessor :debug

    def initialize(options = {})
      @host = options.fetch(:host)

      @client_id = options.fetch(:client_id)
      @client_secret = options.fetch(:client_secret)

      @options = options
    end

    %i(get post delete).each do |http_method|
      define_method(http_method) do |path, payload = {}, &block|
        authenticate!

        resp = connection.send(http_method, path, payload) do |req|
          req.options.params_encoder = Faraday::FlatParamsEncoder
          add_authorization(req)
          block.call(req) unless block.nil?
        end

        resp.body
      end
    end
  end
end
