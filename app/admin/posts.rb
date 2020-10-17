ActiveAdmin.register Post do

  permit_params :user_id, :title, :body, :image, :tag_list, :status

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end

end
