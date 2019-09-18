class Issue < ApplicationRecord
  enum kind: {
    keep:     1,
    try:      2,
    problem:  3
  }, _suffix: true
end
