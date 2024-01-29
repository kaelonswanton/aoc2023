# Rails starter

To get started run the setup:

```
bin/setup
```

This will create the database, run the initial migrations, and install your
dependencies.

Then run your tests to make sure everything is working:

```
bin/rspec
```

Once the system tests pass you can run your dev server:

```
bin/dev
```

This will run your server according to `Procfile.dev` which runs your server,
your javascript bundler and your background workers.

## What is this?

This app began as a vanilla rails app with the following command:

```
rails new -T
          -d postgresql
          --asset-pipeline=propshaft
          --skip-action-text
          --skip-active-storage
          --skip-jbuilder
          --skip-javascript
```

I've since added many conveniences from my 10+ years experience using Rails while
trying to keep it somewhat vanilla.

## Assets and Javascript

This starter uses [Vite](https://vite-ruby.netlify.app/guide/rails.html) for
javascript bundling. Vite alone is responsible for handling our javascript and
stylesheets imported within our `app/javascript/entrypoints/*.js`.

Images on the other hand are handled by
[propshaft](https://github.com/rails/propshaft) for easy use with `image_tag`.

## View components

Components are loaded sidecar style and can contain their own javascript and
stylesheets:

```
app/
    components/
        ui/
            navbar/
                component.rb
                component.html.erb
                controller.js
                styles.css
```

Calling components in the views would normally be somewhat cumbersome:

```ruby
<%= render Navbar::Component.new(current_user:) %>
```

But there is a helper in `app/helpers/component_helper.rb` which lets us use the
`#component` helper:

```ruby
<%= component "navbar", current_user: %>
```

## Icons

Icons are provided by the [Heroicon](https://github.com/bharget/heroicon) gem.

## Static pages

Static pages are provided by the
[high_voltage](https://github.com/thoughtbot/high_voltage) gem.

The homepage is set to be a static page at
`app/views/pages/home.html.erb`

## Tailwindcss and DaisyUI

This starter uses [Tailwind](https://tailwindcss.com/) and
[DaisyUI](https://daisyui.com/) for its design language.

I've also added some standard dynamic spacing which further limits the size of
padding, margin and gaps that I use (to keep things consistent):

```js
// tailwind.config.js
module.exports = {
    content: [
      //  ...
    ]
    theme: {
        extend: {
            gap: {
                xs: "var(--layout-gap-xs)",
                sm: "var(--layout-gap-sm)",
                md: "var(--layout-gap-md)",
                lg: "var(--layout-gap-lg)",
                xl: "var(--layout-gap-xl)",
            },
            padding: {
                xs: "var(--spacing-xs)",
                sm: "var(--spacing-sm)",
                md: "var(--spacing-md)",
                lg: "var(--spacing-lg)",
                xl: "var(--spacing-xl)",
            },
            margin: {
                xs: "var(--spacing-xs)",
                sm: "var(--spacing-sm)",
                md: "var(--spacing-md)",
                lg: "var(--spacing-lg)",
                xl: "var(--spacing-xl)",
            },
            spacing: {
                xs: "var(--spacing-xs)",
                sm: "var(--spacing-sm)",
                md: "var(--spacing-md)",
                lg: "var(--spacing-lg)",
                xl: "var(--spacing-xl)",
            }
        }
    }
},
```

You can customize these variables in the `app/assets/stylesheets/application.css`

## Forms

Forms from [SimpleForm](https://github.com/heartcombo/simple_form) are styled
by default according to DaisyUI.

They are configured in the `config/initializers/simple_form.rb` to be compatible
with how DaisyUI expects your html to be laid out.

Default styles are applied in the `.form` based child selectors in your
`application.css`.

## Mailing

Its expected you provide a `SENDGRID_API_KEY` and a `SMTP_DOMAIN` as 
outlined in the `.env.example` which is used in production to send out emails:

```ruby
# config/environments/production.rb
# ...

config.action_mailer.smtp_settings = {
    user_name: "apikey",
    password: ENV.fetch("SENDGRID_API_KEY", nil),
    domain: ENV.fetch("SMTP_DOMAIN", "example.com"),
    address: "smtp.sendgrid.net",
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true
}
```

In development there is [letter opener](https://github.com/ryanb/letter_opener)
for viewing your mail on
[http://localhost:3000/letter_opener](http://localhost:3000/letter_opener).

## Background jobs

Background jobs are handled by [Sidekiq](https://github.com/sidekiq/sidekiq)
using [Redis](https://redis.io/) from your `REDIS_URL` environment variable.

You can find the defaults in:

- `config/cable.yml`
- `config/sidekiq.yml`
- `config/initializers/sidekiq.rb`

## Security

I've added [Secure Headers](https://github.com/github/secure_headers) as the 
handler for any CSP and other security header
options. They are only used in Production but I've commented out an example of
allowing them in development within `config/initializers/secure_headers.rb`

## Fonts

This starter uses [Fontsource](https://fontsource.org/) to provide fonts 
ourselves rather than through Google fonts.

A custom Tailwindcss plugin located at
`app/javascript/tailwindcss/variable_font_plugin.js` which uses *Inter
Variable* as its default font.

Variable fonts allow for smaller bundles and more control over the presentations
of our fonts through our own plugin.

## Testing

Helpers for testing are loaded from `spec/support/**/*.rb`.

For testing we use:

|Gem|Description|
|---|---|
|[RSpec](https://rspec.info/)|Test runner and framework instead of Minitest|
|[Capybara](https://github.com/teamcapybara/capybara)|For running system tests through the browser|
|[FactoryBot](https://github.com/thoughtbot/factory_bot)|For easily building and creating new models in our tests|
|[Webmock](https://github.com/bblimke/webmock)|To prevent accidentally sending live http requests in our specs|
|[Bullet](https://github.com/flyerhzm/bullet)|To alert us about accidental N+1 queries|

## Debugging

The [debug](https://github.com/ruby/debug) gem is used for both testing
and development debugging.

## Dry-rb

This starter uses quite a bit from the [dry-rb ecosystem](https://dry-rb.org/):

|Gem|Description|
|---|-----------|
|[dry-rails](https://dry-rb.org/gems/dry-rails/main/)|For dependency injection and controller schemas|
|[dry-types](https://dry-rb.org/gems/dry-types/main/)|For type checking|
|[dry-initializer](https://dry-rb.org/gems/dry-initializer/main/)|For better initialization logic|
|[dry-transaction](https://dry-rb.org/gems/dry-transaction/main/)|For creating commands (transactional business logic)|

### Commands

Commands don't exist in vanilla rails and is an abstraction I wanted to keep
logic out of models, which I believe should be more simple representations of
our database relations.

A command should include the `Command` concern located in
`app/commands/concerns` like:

```ruby
# app/commands/sign_in.rb
class SignIn
  include Command

  def call(params)
    user = User.find_or_initialize_by(email: params[:email])

    if user.persisted? && user.authenticate(params[:password])
      session = user.sessions.create!
      Success(session)
    else
      Failure(user)
    end
  end
end
```

Then in your controller you can run these commands:

```ruby
class SessionsController < ApplicationController
  schema(:create) do
    required(:user).schema do
      required(:email).filled(:string)
      required(:password).filled(:string)
    end
  end

  def new
    @user = User.new
  end

  def create
    run "sign_in", user_params do |on|
      on.success do |session|
        cookies.signed.permanent[:session_token] =
          { value: session.id, httponly: true }

        redirect_to root_path, flash: { success: t(".created") }
      end

      on.failure do |user|
        @user = user
        render :new, status: :unprocessable_entity
      end
    end
  end

  private

  def user_params
    safe_params[:user]
  end
end
```

Instead of using the raw `params` hash or the built in rails secure parameters,
we are using `dry-rails` to create controller schemas and using `safe_params` to
get a predictable safe hash back.

## Turbo

This starter uses [Hotwire](https://hotwired.dev/) with
[StimulusJS](https://stimulus.hotwired.dev/).
