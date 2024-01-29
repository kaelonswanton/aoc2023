# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
    mount Lookbook::Engine, at: "/lookbook"
  end
end
