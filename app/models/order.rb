class Order < ActiveRecord::Base
	has_many :order_items, dependent: :destroy
	belongs_to :address
  belongs_to :cart

  attr_accessor :card_number, :card_verification

  def purchase
    response = EXPRESS_GATEWAY.purchase(order.total_amount_cents, express_purchase_options)
    cart.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end

  def express_token=(token)
    self[:express_token] = token
    if new_record? && !token.blank?
      # you can dump details var if you need more info from buyer
      details = EXPRESS_GATEWAY.details_for(token)
      self.express_payer_id = details.payer_id
    end
  end



	def total_price
	order_items.to_a.sum { |item| item.total_price }
	end

private

  def express_purchase_options
    {
      :token => express_token,
      :payer_id => express_payer_id
    }
  end
  



end
