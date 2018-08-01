class ElementsController < ApplicationController
    
    def changeStatus
        @element = Element.find(params[:element_id])
        @element.toggle(:status).save
       
        return @element
    end




end
