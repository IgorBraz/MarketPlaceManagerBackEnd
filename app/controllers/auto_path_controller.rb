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
    
                    depends_on = step[:depends_on]

                    if depends_on && depends_on.length > 0
                        depends_on.each do |dependency|
                            path_step = path_steps[dependency[:step_index].to_i]

                            input_name = dependency[:input_name]

                            json_result = path_step[:action_result]

                            if (input_name.nil? || input_name.blank?)                                
                                action_input = JSON.parse json_result
                            else
                                action_input = JSON.parse json_result

                                action_input = { dependency[:input_name] => action_input }
                            end                            

                            action.add_input action_input
                        end
                    end

                    action.run
    
                    step[:action_result] = action.result.force_encoding("UTF-8")

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