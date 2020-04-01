module InstanceCounter

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    @@instance ||= 0

    def instance_set
      @@instance += 1
    end

    def instances
      @@instance
    end
  end

  private

  def register_instance
    self.class.instance_set
  end

end