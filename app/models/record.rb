class Record < ApplicationRecord
  belongs_to :domain

  validates :name, :rtype, :content, :ttl, presence: true

  enum rtype: { SOA: 0, A: 1, AAAA: 2, NS: 3, PTR: 4, CNAME: 5, MX: 6, SRV: 7, TXT: 8, NAPTR: 9}

end
