Event.create(
  title: '演唱會',
  description: '好棒'
)
Ticket.create(
  name: 'A區',
  price: '1900',
  amount: '250',
  event_id: 1
)
Ticket.create(
  name: 'B區',
  price: '1900',
  amount: '250',
  event_id: 1
)
Ticket.create(
  name: 'C區',
  price: '1900',
  amount: '250',
  event_id: 1
)
Ticket.create(
  name: 'D區',
  price: '1900',
  amount: '250',
  event_id: 1
)
Ticket.create(
  name: 'E區',
  price: '1900',
  amount: '250',
  event_id: 1
)
Ticket.create(
  name: 'F區',
  price: '1900',
  amount: '250',
  event_id: 1
)
250.times do
  Seat.create(
    area: 'A區',
    ticket_id: 1,
    status: 'for_sale'
  )
end
250.times do
  Seat.create(
    area: 'B區',
    ticket_id: 2,
    status: 'for_sale'
  )
end
250.times do
  Seat.create(
    area: 'C區',
    ticket_id: 3,
    status: 'for_sale'
  )
end
250.times do
  Seat.create(
    area: 'D區',
    ticket_id: 4,
    status: 'for_sale'
  )
end
250.times do
  Seat.create(
    area: 'E區',
    ticket_id: 5,
    status: 'for_sale'
  )
end
250.times do
  Seat.create(
    area: 'F區',
    ticket_id: 6,
    status: 'for_sale'
  )
end
