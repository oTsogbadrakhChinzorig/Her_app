class SkuidUser < ActiveRecord::Base

  def initialize(params)
    @params = params
  end

  def method_missing(name, *args, &block)
    begin
      klass.send(name, *args, &block)
    rescue
      Rails.log("Method is missing #{name}")
    end
  end

  private

    def klass_name
      AbstracUser.types.include?(@params.type) ? @params.type : "User"
    end

    def klass
      @clazz = klass_name.constantize
    end
end
