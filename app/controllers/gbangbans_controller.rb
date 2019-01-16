class GbangbansController < ApplicationController

    before_action :set_gbangban, only: [:show, :edit, :update, :destroy]

    def index
        @gbangbans = Gbangban.all
    end

    def show
        @commentaire = Commentaire.new
    end
    def new
        @gbangban = Gbangban.new
    end

    def create
        @gbangban = Gbangban.new(gbangban_params)
        if @gbangban.save
            puts "article bien Enregistré"
            redirect_to gbangbans_path
        else
            puts 'mauvais pratique'
            redirect_to gbangabn_path
        end
    end

    def destroy
        @theme.destroy
    end







    private

    def set_gbangban
        @gbangban = Gbangban.find(params[:id])
    end

    def gbangban_params
        params.require(:gbangban).permit(:titre, :contenu)
    end
    
end