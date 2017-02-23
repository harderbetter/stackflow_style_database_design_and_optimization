after optimization:
a..  select P1.title, tag.tag_name, P1.post_date, user.display_name, count(vote.user_ID),count(P2.ID) from post P1 join posttag on P1.ID = posttag.post_ID join tag on posttag.tag_ID = tag.ID join user on user.ID = P1.user_ID join vote on vote.post_ID = P1.ID join post P2 on P2.parent_post_ID = P1.ID where P1.accpted_post_ID IS NULL and P1.post_type =1 group by P1.ID;


I..  select P1.title, tag.tag_name, P1.post_date, user.display_name, count(vote.user_ID),count(P2.ID) from post P1 join posttag on P1.ID = posttag.post_ID join tag on posttag.tag_ID = tag.ID join user on user.ID = P1.user_ID join vote on vote.post_ID = P1.ID join post P2 on P2.parent_post_ID = P1.ID where P1.accpted_post_ID IS NULL and P1.post_type =1 and tag.tag_name = 'java' group by P1.ID;

ii..   select P1.title, tag.tag_name, P1.post_date, user.display_name, count(vote.user_ID),count(P2.ID) from post P1 join posttag on P1.ID = posttag.post_ID join tag on posttag.tag_ID = tag.ID join user on user.ID = P1.user_ID join vote on vote.post_ID = P1.ID join post P2 on P2.parent_post_ID = P1.ID where P1.accpted_post_ID IS NULL and P1.post_type =1 group by P1.ID order by P1.post_date DESC;

iii.  select P1.title, tag.tag_name, P1.post_date, user.display_name, count(vote.user_ID),count(P2.ID) from post P1 join posttag on P1.ID = posttag.post_ID join tag on posttag.tag_ID = tag.ID join user on user.ID = P1.user_ID join vote on vote.post_ID = P1.ID join post P2 on P2.parent_post_ID = P1.ID where P1.accpted_post_ID IS NULL and P1.post_type =1 group by P1.ID order by count(vote.user_ID) DESC;

b. Select P1.title,P1.body,P1.post_date,U1.display_name,count(F1.user_ID),count(V1.user_ID),count(V2.user_ID),C1.comment_text,C2.comment_text from Post P1 join Post P2 on P2.parent_post_ID = P1.ID join fav F1 on P1.ID = F1.post_ID join user U1 on U1.ID = P1.user_ID join vote V1 on P1.ID = V1.post_ID join comment C1 on C1.post_ID = P1.ID join comment C2 on C2.post_ID = P2.ID join vote V2 on V2.post_ID = P2.ID where P1.post_type=1 and P2.parent_post_ID=57530; 



un-optimized:


a..  select P1.title, tag.tag_name, P1.post_date, user.display_name, count(vote.user_ID),count(P2.ID) from post P1 join posttag on P1.ID = posttag.post_ID join tag on posttag.tag_ID = tag.ID join user on user.ID = P1.user_ID join vote on vote.post_ID = P1.ID join post P2 ignore index(parent_post_ID) on P2.parent_post_ID = P1.ID where P1.accpted_post_ID IS NULL and P1.post_type =1 group by P1.ID;



I..  select P1.title, tag.tag_name, P1.post_date, user.display_name, count(vote.user_ID),count(P2.ID) from post P1 join posttag on P1.ID = posttag.post_ID join tag on posttag.tag_ID = tag.ID join user on user.ID = P1.user_ID join vote on vote.post_ID = P1.ID join post P2 ignore index(parent_post_ID) on P2.parent_post_ID = P1.ID where P1.accpted_post_ID IS NULL and P1.post_type =1 and tag.tag_name = 'java' group by P1.ID; 

ii..   select P1.title, tag.tag_name, P1.post_date, user.display_name, count(vote.user_ID),count(P2.ID) from post P1 join posttag on P1.ID = posttag.post_ID join tag on posttag.tag_ID = tag.ID join user on user.ID = P1.user_ID join vote on vote.post_ID = P1.ID join post P2 ignore index(parent_post_ID) on P2.parent_post_ID = P1.ID where P1.accpted_post_ID IS NULL and P1.post_type =1 group by P1.ID order by P1.post_date DESC;

iii.  select P1.title, tag.tag_name, P1.post_date, user.display_name, count(vote.user_ID),count(P2.ID) from post P1 join posttag on P1.ID = posttag.post_ID join tag on posttag.tag_ID = tag.ID join user on user.ID = P1.user_ID join vote on vote.post_ID = P1.ID join post P2 ignore index(parent_post_ID) on P2.parent_post_ID = P1.ID where P1.accpted_post_ID IS NULL and P1.post_type =1 group by P1.ID order by count(vote.user_ID) DESC;


b.Select P1.title,P1.body,P1.post_date,U1.display_name,count(F1.user_ID),count(V1.user_ID),count(V2.user_ID),C1.comment_text,C2.comment_text from Post P1 join Post P2 ignore index(parent_post_ID) on P2.parent_post_ID = P1.ID join fav F1 on P1.ID = F1.post_ID join user U1 on U1.ID = P1.user_ID join vote V1 on P1.ID = V1.post_ID join comment C1 on C1.post_ID = P1.ID join comment C2 on C2.post_ID = P2.ID join vote V2 on V2.post_ID = P2.ID where P1.post_type=1 and P2.parent_post_ID=57530; 










note:There is no index on post.parent_post_ID at the beginning.We create an index on post.parent_post_ID in the optimization step.So this "ignore index(parent_post_ID)" has the same effect with the initial un-optimized step . 