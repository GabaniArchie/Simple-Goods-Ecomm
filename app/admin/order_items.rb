ActiveAdmin.register OrderItem do
  permit_params :order_id, :product_id, :quantity, :unit_price

  # Specify the filters you want, using a Proc to delay database access
  filter :order, as: :select, collection: -> { Order.all.map { |order| [ "#{order.id}", order.id ] } }
  filter :product
  filter :quantity
  filter :unit_price

  index do
    selectable_column
    id_column
    column :order
    column :product
    column :quantity
    column :unit_price
    actions
  end

  form do |f|
    f.inputs do
      # Use a Proc to delay the query for the order collection
      f.input :order, as: :select, collection: -> { Order.all.map { |order| [ "#{order.id}", order.id ] } }.call
      f.input :product
      f.input :quantity
      f.input :unit_price
    end
    f.actions
  end

  show do
    attributes_table do
      row :order
      row :product
      row :quantity
      row :unit_price
    end
  end
end
