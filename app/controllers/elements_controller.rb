class ElementsController < ApplicationController
    
    def changeStatus
        @element = Element.find(params[:element_id])
        @element.toggle(:status).save
       
        render json: @element

    end

    def refreshElement
        @element = Element.all
    end

end
