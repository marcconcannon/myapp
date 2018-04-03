class Customer < ApplicationRecord
  has_many :users
  belongs_to :plan

def self.getCustomer(params)

  domain = (params[:email]).split('@').last

  if (@customer = Customer.where(domain: domain).first).present?

  else
    @customer = Customer.new
    @customer.name = domain
    @customer.domain = domain
    @customer.plan_id = 1
    @customer.plan_modified_date = DateTime.now.to_date
    if @customer.save
    end
  end

  return @customer
end


end
