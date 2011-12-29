class Overview < ActiveRecord::Base
  self.table_name = 'crates'

  def Overview.get_pending_crates
    return Overview.find_by_sql <<EOSQL
SELECT crates.id, cratepayers.name, crates.reason, crates."date" 
FROM crates, cratepayers 
WHERE (cratepayers.id = crates.cratepayer_id) AND (crates.paid IS NULL);
EOSQL
  end

  def Overview.get_last_paid_crates
    return Overview.find_by_sql <<EOSQL
SELECT crates.id, cratepayers.name, crates.reason, crates."paid" 
FROM crates, cratepayers 
WHERE (cratepayers.id = crates.cratepayer_id) AND (crates.paid IS NOT NULL);
EOSQL
  end

end
