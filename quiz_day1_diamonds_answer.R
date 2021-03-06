# 1. "ggplot2" 패키지의 diamonds 데이터를 불러와서 df 객체에 저장하시오.
data("diamonds", package = "ggplot2")
df = diamonds

# 2. df 객체의 row 개수는 몇 개인가?
nrow(df)

# 3. df 객체의 column 개수는 몇 개인가?
ncol(df)

# 4. df 객체의 데이터에는 색상[color]이 몇 종류 기록되어있는가?
length(unique(df$color))

# 5. df 객체의 데이터에는 투명도[clarity]가 몇 종류 기록되어있는가?
length(unique(df$clarity))

# 6. 가장 비싼 다이아몬드의 가격은 얼마인가?
max(df$price)

# 7. 색상[color]이 "E"이면서 가격[price]이 4000이 넘는 다이아몬드는 몇 개인가?
nrow(df[(df$color == "E") & (df$price > 4000),])
sum((df$color == "E") & (df$price > 4000))

# 8. 세공[cut]이 "Ideal" 이면서 색상[color]이 "E"인 다이아몬드의 가격 평균은 얼마인가?
# (반올림하여 소수점 둘 째 자리까지 표기하시오)
round(mean(df[(df$cut == "Ideal") & (df$color == "E"), "price"]),2)
 
# 9. 세공[cut]이 "Good"이거나 "Premium"이면서 색상[color]이 "E"인 데이터를 추출하여 df_sub 객체에 저장하시오.
df_sub = df[(df$cut %in% c("Good", "Premium")) & (df$color == "E"),]

# 10. df_sub 객체의 가격 평균은 얼마인가?
mean(df_sub$price)

# 11. df_sub 객체의 투명도[clarity] 변수에 있는 원소의 비중을 확인하시오. 가장 비중이 높은 것은 무엇인가?
# (정답 예시: SI2, 10.12%)
round(prop.table(table(df_sub$clarity)), 2)

