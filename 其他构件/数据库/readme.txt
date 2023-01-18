请添加代理作业：叶子统计
目的：每天在LeavesStatidtics表插入一条数据
添加步骤：每天为每个用户创建一条记录
类型：Transact-SQL脚本
命令：insert into LeavesStatistics(UserId) select userid from UserInformation

添加计划
类型：重复执行
执行频率：每天
执行间隔：一天
每天频率：执行一次，时间为20:55