class Overview < ActiveRecord::Base
  self.table_name = 'crates'

  def Overview.get_pending_crates
    return Overview.find_by_sql <<EOSQL
SELECT crates.id, cratepayers.name, crates.reason, crates.date, crates.crate_type, crate_priorities.description
FROM crates, cratepayers, crate_priorities
WHERE (crates.paid IS NULL) AND (cratepayers.id = crates.cratepayer_id) AND (crates.crate_priority_value = crate_priorities.priority)
ORDER BY crates.crate_priority_value DESC, crates.date ASC
EOSQL
  end

  def Overview.get_last_paid_crates
    return Overview.find_by_sql <<EOSQL
SELECT crates.id, cratepayers.name, crates.reason, crates.paid, crates.crate_type, crate_priorities.description
FROM crates, cratepayers, crate_priorities
WHERE (crates.paid IS NOT NULL) AND (cratepayers.id = crates.cratepayer_id) AND (crates.crate_priority_value = crate_priorities.priority)
ORDER BY crates.crate_priority_value DESC, crates.date ASC
EOSQL
  end

end
