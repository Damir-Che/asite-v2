ActiveAdmin.register History do

  permit_params :title, :body, :source, :image

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
  
end
