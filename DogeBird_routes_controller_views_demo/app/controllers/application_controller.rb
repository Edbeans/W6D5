class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token 
    # before the action goes through, we're running above action to prevent hackers intercepting the request 
    # when working on your real app, take this out before production, otherwise people will know you dont know how to protect your app 
end
