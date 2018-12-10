class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    comment.user_id = params[:comment][:user_id]
    binding.pry
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end

# {"utf8"=>"✓",
#  "authenticity_token"=>
#   "oYsgnYKRsufi0pW1fCTeYAV+lTPCkL4esGDW/XPUoPrT6YCCl0IEABHSaXR5w+Vt3l0QmfitlbaeLdmmaRZpew==",
#  "comment"=>{"content"=>"comment4", "user_id"=>["1", ""]},
#  "commit"=>"Create Comment",
#  "controller"=>"comments",
#  "action"=>"create"}
