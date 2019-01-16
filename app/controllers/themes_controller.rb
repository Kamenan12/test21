class ThemesController < ApplicationController
    before_action :set_theme, only: [:show, :edit, :update, :destroy]
    

    def index
        @themes = Theme.all
        @theme = Theme.new
    end


    def show
        
    end
    def edit
        
    end

    def create
        @theme = Theme.new(theme_params)

        if @theme.save
            puts 'theme bien enristré'
            redirect_to themes_path #Redirige vers la methode index
        else
            puts 'quelque chose est mal passé'
            redirect_to theme_path # redirige vers show
        end
    end

    def update
        @theme.update(theme_params)
        redirect_to theme_path #Redirige vers la methode show
    end

    def destroy
        @theme.destroy
        redirect_to themes_path # redirige vers index
        
    end





    private

    def set_theme
        @theme = Theme.find(params[:id])
    end


    def theme_params
        params.require(:theme).permit(:titre, :sous_titre)
    end
end