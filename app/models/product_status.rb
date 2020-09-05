class ProductStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '新品未使用' },
    { id: 3, name: '未使用に近い' },
    { id: 4, name: '目立った傷や汚れなし' },
    { id: 5, name: '目立った傷や汚れあり' },
    { id: 6, name: '傷や汚れあり' },
    { id: 7, name: '全体的に状態が悪い' },
    { id: 8, name: '自己責任でのご購入お願いします' }
  ]
end
