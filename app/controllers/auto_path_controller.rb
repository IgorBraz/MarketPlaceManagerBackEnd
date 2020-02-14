class AutoPathController < ApplicationController
    def run
        begin
            requestBody = params[:auto_path]

            path_steps = requestBody[:steps]

            path_steps.sort_by!{ |hash| hash[:index] }.each do |step|
                begin
                    step_connector = step[:connector]
                    step_action = step[:action]
    
                    connectorId = step_connector[:id]
                    actionId = step_action[:id]
                    
                    connector_directory = File.join('C:', 'Users', 'igorb', 'Desktop', 'connectors', connectorId)

                    $LOAD_PATH << connector_directory unless $LOAD_PATH.include?(connector_directory)
    
                    require connectorId
                    require actionId
    
                    action = Object.const_get(actionId.classify).new
    
                    action.set_connector_parameters step_connector[:parameters]
                    action.set_action_parameters step_action[:parameters]
    
                    action.run
    
                    step[:action_result] = action.result

                    step[:status] = "Completed"
                rescue => exception
                    step[:action_result] = exception.message

                    step[:status] = "Error"
                end                
            end

            render json: path_steps
        rescue Exception => exception
            render json: exception.message, status: :internal_server_error
        end
    end
end