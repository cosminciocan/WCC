class CollectionsPage
  include PageObject


  page_url "#{EnvConfig['MEMBER_SITE_URL']}/admin/structure/taxonomy/collections"

  link(:add_category, :text => 'Add term')
  text_field(:category_name, :id => 'edit-name')


 $category_name = "AUTOMATION CATEGORY NAME"
  def create_category
    self.add_category
    self.category_name = $category_name
  end
end
