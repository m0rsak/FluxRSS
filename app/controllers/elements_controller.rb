class ElementsController < ApplicationController
    
    def changeStatus #Méthode qui invers le boolean du status puis le save en base de données
        @element = Element.find(params[:element_id])
        @element.toggle(:status).save
        render json: @element
    end

    def refreshElements #Méthode qui permet de rafraichir le contenu des flux RSS
        fluxes = Flux.includes(:elements)
        
        rss_results = []

        fluxes.each do |flux|
            rss = RSS::Parser.parse(open(flux.url).read, false).items[0..4]
            
            i=0 # on étable un index qui va s'incrémenter pour parcourir l'array rss
            for element in flux.elements
                @element = Element.find(element.id)
                                
                if @element.title != rss[i].title # on update en base de donnée seulement si le titre du contenu est différent (donc nouveau)
                    @element.update(title: rss[i].title, resum: rss[i].description , date: rss[i].date , status: 0, url: rss[i].link , flux_id: flux.id)
                end
            
                i+=1
            end         
        end
    end
end