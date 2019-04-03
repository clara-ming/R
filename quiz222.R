#### 1. 'population_country.csv' 파일을 data.table 패키지의 fread() 함수를 사용하여 읽어오고 df 객체에 저장하시오.
(단, data.table 인자의 값은 FALSE로 한다.)
install.packages("bit64")
library("data.table")
df = fread("population_country.csv", data.table = FALSE)
head(df)

#### 2. df의 row 개수는 몇 개 인가?
nrow(df)

#### 3. 한 국가당 하나의 row를 가지고 있는지 국가명[Country_Name] 변수를 활용하여 계산하시오.
nrow(df) == length(unique(df$`Country Name`))

#### 4. "Arab World"와 "World" 국가 데이터를 제외한 나머지 국가의 데이터를 df_sub 객체에 저장하시오.
#1)
df_sub = df[df$`Country Name` != "Arab World", ]
df_sub = df_sub[df_sub$`Country Name` != "World", ]
#2)
df_sub = df[df$`Country Name` != c("Arab world","world"), ]
#3)
df_sub = df[!df$`Country Name` %in% c("Arab world","world"), ]

#### 5. df_sub 객체의 row 개수는 몇 개 인가?
nrow(df_sub)
df_sub

#### 6. df_sub 객체의 결측치 개수는 총 몇 개 인가?
#1)
summary(df_sub)

#2)
for(n in 1:ncol(df_sub)){
  print(sum(is.na(df_sub[, n])))
}
na_sum = c()
for(n in 1:ncol(df_sub)){
  na_sum[n] = sum(is.na(df_sub[, n]))
}
sum(na_sum)

#3)
na_cnt = function(x){
  sum(is.na(x))
} 
apply(df_sub, MARGIN = 2, FUN = "na_cnt")
sum(apply(df_sub, MARGIN = 2, FUN = "na_cnt"))

#4)
sum(is.na(df_sub))

#### 7. df_sub 객체의 결측치를 전부 0으로 치환하시오.
df_sub[is.na(df_sub)] = 0

#### 8. df_sub 객체의 속성을 data.frame에서 data.table 속성으로 변환하고 이를 확인하시오.


#### 9. df_sub 객체를 data.table 패키지의 melt() 함수를 사용하여 국가명[Country_Name], 연도[year], 인구수[pop] 정보를 담고있는 df_melt 객체를 생성하시오.
(data.table 패키지의 melt() 함수는 data.frame 패키지의 melt() 함수 용례와 같다.)

#### 10. df_melt 객체의 속성을 data.frame으로 변환하고 이를 확인하시오.

#### 11. df_melt 객체의 인구[pop] 변수가 0인 것을 제거하고 row 개수를 확인하시오.

#### 12. df_melt 객체의 데이터 중 연도가 2014년인 것을 제거하시오.

#### 13. df_melt 객체의 국가명[Country_Name] 변수의 고유값을 clist 변수에 저장하시오.

#### 14. 비어있는 데이터프레임 객체인 df_slope 객체를 생성하시오.

#### 15. 각 국가별 인구 증가율을 계산하고 그 증가율이 가장 높은 국가를 기술하시오.
※ clist와 df_slope 객체 활용 권장
※ 인구 증가율은 데이터가 있는 연도를 기준으로(1980부터 기록된 경우 1980년 부터 2016년 까지) 계산하시오.
※ 국가별 데이터가 기록된 최초 연도를 기준으로 그 증가율을 계산하시오.

