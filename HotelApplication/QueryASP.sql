









declare @startDate date;
declare @endDate date;

set @startDate = '12/14/2019';
set @endDate = '12/15/2019';

select t.Id, t.Title, t.Description, t.Price
from dbo.Rooms r
inner join dbo.RoomTypes t on t.id = r.RoomTypeId
where r.Id not in (
select b.RoomId
from dbo.Bookings b
where (@startDate < b.StartDate and @endDate > b.EndDate)
or (b.StartDate <= @endDate and @endDate < b.EndDate)
or (b.StartDate <= @startDate and @startDate < b.EndDate)

)
group by t.Id, t.Title, t.Description, t.Price










