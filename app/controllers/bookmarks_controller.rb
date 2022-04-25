class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.create(blog_id: params[:blog_id])
    redirect_to blogs_path, notice: "#{bookmark.blog.user.name}さんの投稿をお気に入り登録しました"
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(id: params[:id]).destroy
    redirect_to blogs_path, notice: "#{bookmark.blog.user.name}さんの投稿をお気に入り解除しました"
  end

  def show
    bookmarks = Bookmark.where(user_id: current_user.id).pluck(:blog_id)
    @bookmark_list = Blog.find(bookmarks)
  end
end
