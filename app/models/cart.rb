class Cart < ActiveRecord::Base
  has_many :cart_items
  before_create :set_defaults

  def as_json(options = {})
    super(options.merge(include: :cart_items)).tap do |hash|
      # only include active cart_items
      hash['cart_items'].reject! { |ci| !%w(added modified).include?(ci['status']) }
    end
  end

  private

  def set_defaults
    self.status = 'in_shopping'
  end
end
