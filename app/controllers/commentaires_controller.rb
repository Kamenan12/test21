class CommentairesController < ApplicationController
    

    def index
        @commentaires = @gbangban.commentaires
    end

    def create
        @commentaire = Commentaire.new(commentaire_params)
        if @commentaire.save
            @gbangban = @commentaire.gbangban
            respond_to :js
        else
            puts "commentaire pas ajouté"
            respond_to :js
        end
    end







    private

    def commentaire_params
        params.require(:commentaire).permit(:content, :gbangban_id)
    end

end