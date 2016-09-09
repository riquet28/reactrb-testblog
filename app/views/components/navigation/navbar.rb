module Components
  module Navigation
    class Navbar < React::Component::Base

      def say_hello(i)
        alert "Hello from number #{i}"
      end

      def render
        div do
          ReactBootstrap::Navbar(bsStyle: :inverse) do
            ReactBootstrap::Nav() do
              ReactBootstrap::NavbarBrand() do
                a(href: '#') { 'Reactrb Testblog' }
              end
              ReactBootstrap::NavDropdown(eventKey: 1, title: 'Things', id: :drop_down) do
                (1..5).each do |n|
                  ReactBootstrap::MenuItem(href: '#', key: n, eventKey: "1.#{n}") do
                    "Number #{n}"
                  end.on(:click) { say_hello(n) }
                end
              end
            end
          end
        end
      end

    end
  end
end
