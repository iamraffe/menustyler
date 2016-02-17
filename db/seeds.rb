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

@m =User.create! name: 'Michu Benaim', email: 'michu@weareinhouse.com', :password => 'topsecret', :password_confirmation => 'topsecret', username: 'michu'

@due.users << @m

Menu.destroy_all

@wine_list = Menu.create! name: 'Wine list',  group_id: @due.id, template:  %{
  <ul class="list-unstyled">
    {% for category in categories %}
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
}

@menu = Menu.create! name: 'Menu',  group_id: @due.id, template: %{
  <ul class="list-unstyled">
    {% for category in categories %}
      <li class="draggable">
        {{ category.name }}
          <ul class="list-unstyled">
          {% if category.subcategories != null %}
            {% for subcategory in category.subcategories %}
              {% if subcategory.subcategories != null %}
                {% for sc in subcategory.subcategories %}
                  <ul class="list-unstyled">
                    {% for item in sc.items %}
                      <li>{{ item.text }}</li>
                    {% endfor %}
                  </ul>
                {% endfor %}
              {% else %}
                <li>
                  {{ subcategory.name }}
                  <ul class="list-unstyled">
                    {% for item in subcategory.items %}
                      <li>{{ item.text }}</li>
                    {% endfor %}
                  </ul>
                </li>
              {% endif %}
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
}
# Category.destroy_all

# 15.times{ |i| Category.create! name: Faker::Hacker.abbreviation, position: i, menu_id: [@wine_list.id, @menu.id].sample }

# Subcategory.destroy_all

# 15.times{ |i| Subcategory.create! name: Faker::Name.title, position: i, category_id: (0..15).to_a.sample }

# Item.destroy_all

# 45.times{ |i| Item.create! text: Faker::Lorem.sentence(3), position: i, category_id: (0..15).to_a.sample, subcategory_id: (0..15).to_a.sample}