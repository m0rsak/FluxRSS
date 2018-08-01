class FluxesController < ApplicationController
  
  require "open-uri"
  require "rss"
  require "element"
  
  def index
    @flux = Flux.new 
    @fluxes = Flux.includes(:elements).all
    
  end 
  
  
  def create
    @flux = Flux.new
    @element = Element.new
    rss_results = []
    
    if @flux.update(flux_params)
      
      
      rss = RSS::Parser.parse(open(flux_params[:url]).read, false).items[0..5]
      rss.each do |result|
        result = { title: result.title, date: result.pubDate, link: result.link, description: result.description }
        rss_results.push(result)
      end
      
      if success = @flux.save
        lastFlux = Flux.last
        rss_results.each do |element|
          element = Element.create(title: element[:title], resum: element[:description], date: element[:date], status: 0, url: element[:link], flux_id: lastFlux[:id])
        end
      end
      
      redirect_to root_path
    else
      render :index
    end
  end
  
  
  private
  
  def flux_params
    params.require(:flux).permit(:title, :url)
  end
  
end
