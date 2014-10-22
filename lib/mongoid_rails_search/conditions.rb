module MongoidRailsSearch

  module Conditions

    EQUAL = 'eq'
    GREAT_THAN_EQUAL = 'gte'
    GREATE_THAN = 'gt'
    LESS_THAN_EQUAL = 'lte'
    LESS_THAN = 'lt'

    CONDITIONS = {'=' => EQUAL, '>=' => GREAT_THAN_EQUAL, '<=' => LESS_THAN_EQUAL, '>' => GREATE_THAN, '<' => LESS_THAN}

  end

end
