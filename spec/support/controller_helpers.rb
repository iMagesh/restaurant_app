module ControllerHelpers
  def sign_in(user = double('user'))
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
      allow(controller).to receive(:current_user).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end
  end
end


def attributes_with_foreign_keys(*args)
  FactoryGirl.build(*args).attributes.delete_if do |k, v| 
    ["id", "type", "created_at", "updated_at"].member?(k)
  end
end
