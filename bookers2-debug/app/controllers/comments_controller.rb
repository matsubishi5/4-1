class CommentsController < ApplicationController
    def create
        book = Book.find(params[:book_id])
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.book_id = book.id
        @comment.save
    end

    # def destroy
    #     book = Book.find(params[:book_id])
    #     @comment = Comment.find_by(user_id: current_user.id, book_id: book.id)
    #     @comment.destroy
    #     redirect_to book_path(book)
    # end

    def destroy
        book = Book.find(params[:id])
        @comment = book.comments.find(params[:book_id])
        @comment.destroy
        redirect_to book_path(book)
    end

    def comment_params
        params.require(:comment).permit(:body)
    end
end