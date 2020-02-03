class ManagerController < ApplicationController
  def manage
    requestBody = params[:manager]

    restClient = RestClientFactory.create requestBody[:marketPlace]

    responseBody = restClient.get

    render json: responseBody
  end
end
