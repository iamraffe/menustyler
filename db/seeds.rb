# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Group.destroy_all

@due = Group.create! name: 'Bufalina Due', subdomain: 'bufalinadue', email: 'bufalinapizza.com'

User.destroy_all

@u = User.create! name: 'Michu Benaim', email: 'michu@weareinhouse.com', :password => 'topsecret', :password_confirmation => 'topsecret', username: 'michu'

@due.users << @u

Menu.destroy_all

Template.destroy_all

Section.destroy_all

@s1 = Section.create! position: 1

@s2 = Section.create! position: 2

@s3 = Section.create! position: 3

@m = Menu.create! name: 'Menu',  group_id: @due.id

@t = @m.templates.create! name: 'Basic menu template', description: "This is our most basic iteration of the menu template at Bufalinadue", structure:  %{
<div class="left-column" style="float: left;">
  {% for section in sections %}
    <div id="menu--section--{{section.position}}">
      {% if section.position < 3 %}
        <ul class="list-unstyled">
          {% for category in section.categories %}
            <li class="draggable">
              {{ category.name }}
                <ul class="list-unstyled">
                {{ category.subcategories.empty? }}
                {% if !category.subcategories.empty? %}
                  {% for subcategory in category.subcategories %}
                    <li>
                      {{ subcategory.name }}
                      <ul class="list-unstyled">
                        {% for item in subcategory.items %}
                          <li>{{ item.text }}</li>
                        {% endfor %}
                      </ul>
                    </li>
                  {% endfor %}
                {% else %}
                  {{ category.items.empty? }}
                  {% for item in category.items %}
                    <li>{{ item.text }}</li>
                  {% endfor %}
                {% endif %}
              </ul>
            </li>
          {% endfor %}
        </ul>
      {% endif %}
    </div>
  {% endfor %}
</div>
<div class="right-column" style="float: right;">
  {% for section in sections %}
    <div id="menu--section--{{section.position}}">
      {% if section.position > 2 %}
        <ul class="list-unstyled">
          {% for category in section.categories %}
            <li class="draggable">
              {{ category.name }}
                <ul class="list-unstyled">
                {% if category.subcategories != null %}
                  {% for subcategory in category.subcategories %}
                    <li>
                      {{ subcategory.name }}
                      <ul class="list-unstyled">
                        {% for item in subcategory.items %}
                          <li>{{ item.text }}</li>
                        {% endfor %}
                      </ul>
                    </li>
                  {% endfor %}
                {% else %}
                  {% for item in category.items %}
                    <li>{{ item.text }}</li>
                  {% endfor %}
                {% endif %}
              </ul>
            </li>
          {% endfor %}
        </ul>
      {% endif %}
    </div>
  {% endfor %}
</div>
}

@t.sections << @s1

@t.sections << @s2

@t.sections << @s3

Category.destroy_all

@starters = Category.create! name: "Starters", position: 1, section_id: @s1.id

@pizza = Category.create! name: "Pizza", position: 2, section_id: @s1.id

@dessert = Category.create! name: "Dessert", position: 3, section_id: @s1.id

Item.destroy_all

@starters.items  << Item.create!(text: "today's mozzarella ... 8", position: 1)

@starters.items  << Item.create!(text: "cerignola olives ... 5", position: 2)

@starters.items  << Item.create!(text: "bibb salad – cucumber, melon, mint, scallion, vinaigrette ... 8", position: 3)

@starters.items  << Item.create!(text: "tomato & melon salad – peach chili sauce, mint, olive oil 8 rosemary focaccia - house chèvre, fig jam ... 9", position: 4)

@starters.items  << Item.create!(text: "burrata – eggplant, roasted pepper, romesco, basil, olive oil ... 12", position: 5)

@starters.items  << Item.create!(text: "culatello & old parmigiano – sicilian olive oil, 10 yr balsamic, arugula ... 12", position: 6)

@starters.items  << Item.create!(text: "meat plate – la quercia tamworth prosciutto, house nduja, salumeria, biellese finochietta, house pickles, red pepper mostarda ... 12", position: 7)

@starters.items  << Item.create!(text: "cheese plate – montboissie, fiore sardo, bayley hazen blue, marcona, almonds, peach jam, house pickles ... 12", position: 8)

@starters.items  << Item.create!(text: "orecchiette – pesto, summer squash ... 12", position: 9)

# @menu = Menu.create! name: 'Menu',  group_id: @due.id, template: %{
#   <ul class="list-unstyled">
#     {% for category in categories %}
#       <li class="draggable">
#         {{ category.name }}
#           <ul class="list-unstyled">
#           {% if category.subcategories != null %}
#             {% for subcategory in category.subcategories %}
#               {% if subcategory.subcategories != null %}
#                 {% for sc in subcategory.subcategories %}
#                   <ul class="list-unstyled">
#                     {% for item in sc.items %}
#                       <li>{{ item.text }}</li>
#                     {% endfor %}
#                   </ul>
#                 {% endfor %}
#               {% else %}
#                 <li>
#                   {{ subcategory.name }}
#                   <ul class="list-unstyled">
#                     {% for item in subcategory.items %}
#                       <li>{{ item.text }}</li>
#                     {% endfor %}
#                   </ul>
#                 </li>
#               {% endif %}
#             {% endfor %}
#           {% else %}
#             {% for item in category.items %}
#               <li>{{ item.text }}</li>
#             {% endfor %}
#           {% endif %}
#         </ul>
#       </li>
#     {% endfor %}
#   </ul>
# }
# Category.destroy_all

# 15.times{ |i| Category.create! name: Faker::Hacker.abbreviation, position: i, menu_id: [@wine_list.id, @menu.id].sample }

# Subcategory.destroy_all

# 15.times{ |i| Subcategory.create! name: Faker::Name.title, position: i, category_id: (0..15).to_a.sample }

# Item.destroy_all

# 45.times{ |i| Item.create! text: Faker::Lorem.sentence(3), position: i, category_id: (0..15).to_a.sample, subcategory_id: (0..15).to_a.sample}