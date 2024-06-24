class CommentsController < ApplicationController
   before_action :set_article
   before_action :set_comment,only:[:destroy,:edit,:update]
   before_action :require_same_user,only: [:edit,:update,:destroy]
  
  def create
    
      @comment = @article.comments.build(comments_params)
      @comment.user=current_user
      
        if @comment.save
            flash[:notice]="Comment is created Successfully!"
            redirect_to article_path(@comment.article)
        else
          flash[:alert]="Article is saved successfully"
          redirect_to article_path(@article)
        end

  end
  
  def edit
    @comments= @article.comments.custom_display
     render 'articles/show'
  end
  def update
   
    @comment.update(comments_params)
    redirect_to article_path(@comment.article), notice: 'Comment was successfullyUpdated.'
  end

  def destroy
    
    @comment.destroy
    redirect_to article_path(@comment.article), notice: 'Comment was successfully deleted.'
  end
  private 
  def set_article
    @article = Article.find(params[:article_id])
  end 
  def set_comment
    @comment=@article.comments.find(params[:id])
  end
  def comments_params
      params.require(:comment).permit(:message)
  end
  def require_same_user
    if current_user != @comment.user &&  !current_user.is_admin? && current_user !=@article.user 
        flash[:alert]="You can Edit or Delete Your Own Comments Only"
        redirect_to root_path
    end
  end
end
