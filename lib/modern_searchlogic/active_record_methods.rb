require_relative 'default_scoping'
require_relative 'scope_tracking'
require_relative 'column_conditions'
require_relative 'ordering'
require_relative 'scope_procedure'
require_relative 'searchable'

module ModernSearchlogic
  module ActiveRecordMethods
    def self.install
      ActiveRecord::Base.__send__(:include, self)
      ActiveRecord::Relation.__send__(:include, Ordering)
    end

    def self.included(base)
      base.include DefaultScoping
      base.include ScopeTracking
      base.include ColumnConditions
      base.include ScopeProcedure
      base.include Searchable
    end
  end
end
