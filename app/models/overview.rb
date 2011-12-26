class Overview < ActiveRecord::Base
  self.table_name = 'craters'

  def Overview.get_pending_craters
    return Overview.find_by_sql <<EOSQL
SELECT craters.id, craterpayers.name, craters.reason, craters."date" 
FROM craters, craterpayers 
WHERE (craterpayers.id = craters.craterpayer_id) AND (craters.paid IS NULL);
EOSQL
  end

  def Overview.get_last_paid_craters
    return Overview.find_by_sql <<EOSQL
SELECT craters.id, craterpayers.name, craters.reason, craters."paid" 
FROM craters, craterpayers 
WHERE (craterpayers.id = craters.craterpayer_id) AND (craters.paid IS NOT NULL);
EOSQL
  end

end
