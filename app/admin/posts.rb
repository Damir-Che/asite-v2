ActiveAdmin.register Post do

  permit_params :user_id, :title, :body, :image, :tag_list
  
end
