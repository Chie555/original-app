class Today < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'ヘアサロン' },
    { id: 2, name: 'ネイルサロン' },
    { id: 3, name: 'まつげサロン' },
    { id: 4, name: 'リラクゼーション' },
    { id: 5, name: 'エステ' },
    { id: 6, name: 'その他' },
  ]
end