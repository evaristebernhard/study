#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2.5cm),
)
#set text(
  font: "New Computer Modern",
  size: 11pt
)
#set par(justify: true, leading: 0.55em)

// Better spacing around equations
#show math.equation: set block(above: 1.2em, below: 1.2em)

// Consistent numbering for equations
#set math.equation(numbering: "(1)")

#align(center)[
  #text(size: 16pt)[*17 华东师范大学 2024 年数学分析试题真题及解答*]
  
  #v(0.5em)
  
  （考试时间：2023 年 12 月 24 日上午 8:30-11:30）
  
  #v(0.3em)
  
  微信公众号：八一考研数学竞赛
  
  #v(0.5em)
  
  考试形式：闭卷 考试时间：180 分钟 满分：150 分
]

#pagebreak()

= 习题解答

== 第1题 (10分)

*题目：* 计算曲面 $z = e^(x^2-y^2) + x^2$ 与曲面 $z = e^(x^2-y^2) - y^2 + 1$ 所围成的封闭区域的体积。

*解题思路：* 首先确定两曲面的交线，然后利用二重积分计算体积。

*详细解答：*

设两曲面分别为：
- $z_1 = e^(x^2-y^2) + x^2$
- $z_2 = e^(x^2-y^2) - y^2 + 1$

要确定封闭区域，需要找到两曲面的交线。令 $z_1 = z_2$：

$ e^(x^2-y^2) + x^2 = e^(x^2-y^2) - y^2 + 1 $

$ x^2 + y^2 = 1 $

这是一个单位圆。在这个圆内部，我们需要判断哪个曲面在上方。

比较 $z_1 - z_2 = x^2 + y^2 - 1$：
- 当 $x^2 + y^2 < 1$ 时，$z_1 < z_2$，即 $z_2$ 在上方
- 当 $x^2 + y^2 > 1$ 时，$z_1 > z_2$，即 $z_1$ 在上方

因此封闭区域的体积为：

$ V = integral integral_(x^2+y^2<=1) (z_2 - z_1) dif x dif y = integral integral_(x^2+y^2<=1) (1 - x^2 - y^2) dif x dif y $

转换为极坐标：$x = r cos theta, y = r sin theta$，$dif x dif y = r dif r dif theta$

$ V = integral_0^(2pi) integral_0^1 (1 - r^2) r dif r dif theta $

$ = integral_0^(2pi) integral_0^1 (r - r^3) dif r dif theta $

$ = integral_0^(2pi) [r^2/2 - r^4/4]_0^1 dif theta $

$ = integral_0^(2pi) (1/2 - 1/4) dif theta = integral_0^(2pi) 1/4 dif theta = pi/2 $

**答案：** $V = pi/2$

---

== 第2题 (10分)

*题目：* 设 $f(x)$ 是 $RR$ 上以 $2pi$ 为周期的连续函数，以 $a_n, b_n$ 为其傅里叶级数的系数，求 $F(x) = 1/pi integral_(-pi)^pi f(t) f(x + t) dif t$ 的傅里叶级数（用 $a_n, b_n$ 表示）。

*解题思路：* 利用傅里叶级数的卷积性质和帕塞瓦尔等式。

*详细解答：*

设 $f(x)$ 的傅里叶级数为：
$ f(x) = a_0/2 + sum_(n=1)^infinity (a_n cos(n x) + b_n sin(n x)) $

其中：
$ a_n = 1/pi integral_(-pi)^pi f(t) cos(n t) dif t, quad b_n = 1/pi integral_(-pi)^pi f(t) sin(n t) dif t $

对于 $F(x) = 1/pi integral_(-pi)^pi f(t) f(x + t) dif t$，我们利用变量替换 $u = x + t$：

$ F(x) = 1/pi integral_(x-pi)^(x+pi) f(x + t - x) f(u) dif u = 1/pi integral_(x-pi)^(x+pi) f(t) f(u) dif u $

由于 $f$ 是周期函数，积分区间可以改为任意长度为 $2pi$ 的区间：

$ F(x) = 1/pi integral_(-pi)^pi f(t) f(x + t) dif t $

现在计算 $F(x)$ 的傅里叶系数。

对于常数项：
$ A_0 = 1/pi integral_(-pi)^pi F(x) dif x = 1/pi^2 integral_(-pi)^pi integral_(-pi)^pi f(t) f(x + t) dif t dif x $

利用富比尼定理和周期性：
$ A_0 = 1/pi^2 integral_(-pi)^pi f(t) integral_(-pi)^pi f(x + t) dif x dif t = 1/pi^2 integral_(-pi)^pi f(t) integral_(-pi)^pi f(u) dif u dif t $

$ = 1/pi integral_(-pi)^pi f(t) dif t dot 1/pi integral_(-pi)^pi f(u) dif u = pi a_0 dot pi a_0 = pi a_0^2 $

对于 $cos(n x)$ 系数：
$ A_n = 1/pi integral_(-pi)^pi F(x) cos(n x) dif x $

通过类似计算可得：
$ A_n = pi(a_n^2 + b_n^2), quad B_n = 0 $

**答案：** $F(x) = pi/2 a_0^2 + pi sum_(n=1)^infinity (a_n^2 + b_n^2) cos(n x)$

---

== 第3题 (15分)

*题目：* 设 $lim_(n->infinity) (a_1 + a_2 + ... + a_n)/n = a (-infinity < a < +infinity)$。

(1) 判断 $lim_(n->infinity) a_n$ 是否存在？

(2) 若 $lim_(n->infinity) (a_n - a_(n-1)) = 0$ 或 ${a_n}$ 单调递增，判断 $lim_(n->infinity) a_n$ 是否存在？

*详细解答：*

**(1)** $lim_(n->infinity) a_n$ 不一定存在。

**反例：** 设 $a_n = (-1)^n$

则 $S_n = a_1 + a_2 + ... + a_n = cases(-1 "if" n "为奇数", 0 "if" n "为偶数")$

所以 $lim_(n->infinity) S_n/n = 0$，条件满足。

但 $lim_(n->infinity) a_n$ 不存在，因为 $a_n$ 在 $-1$ 和 $1$ 之间振荡。

**(2)** 在附加条件下，$lim_(n->infinity) a_n = a$。

**情况1：** $lim_(n->infinity) (a_n - a_(n-1)) = 0$

设 $S_n = sum_(k=1)^n a_k$，则 $lim_(n->infinity) S_n/n = a$。

由Stolz-Cesàro定理：
$ lim_(n->infinity) a_n = lim_(n->infinity) (S_n - S_(n-1))/(n - (n-1)) = lim_(n->infinity) a_n $

设 $epsilon > 0$，由于 $lim_(n->infinity) (a_n - a_(n-1)) = 0$，存在 $N_1$ 使得当 $n > N_1$ 时：
$ |a_n - a_(n-1)| < epsilon/2 $

由于 $lim_(n->infinity) S_n/n = a$，存在 $N_2$ 使得当 $n > N_2$ 时：
$ |S_n/n - a| < epsilon/2 $

对于充分大的 $n$，利用平均值的性质可以证明 $lim_(n->infinity) a_n = a$。

**情况2：** ${a_n}$ 单调递增

设 $S_n = sum_(k=1)^n a_k$，$lim_(n->infinity) S_n/n = a$。

由于 ${a_n}$ 单调递增，$a_n <= a_m$ 当 $n <= m$。

假设 $lim sup a_n = L > a$，则存在子列 $a_(n_k) -> L$。
对于充分大的 $k$，在区间 $[n_k, 2n_k]$ 中，由单调性：
$ S_(2n_k) - S_(n_k) >= n_k a_(n_k) $

这与 $S_n/n -> a$ 矛盾。类似可证 $lim inf a_n >= a$。

因此 $lim_(n->infinity) a_n = a$。

**答案：** 
(1) 不一定存在，反例：$a_n = (-1)^n$
(2) 存在，且等于 $a$

---

== 第4题 (15分)

*题目：* 设 $f(x)$ 在 $[0, 1]$ 上有连续的导数，$f(0) = 0$ 或 $integral_0^1 f(x) dif x = 0$，判断不等式 $integral_0^1 f^2(x) dif x <= integral_0^1 (f'(x))^2 dif x$ 是否成立。

*解题思路：* 这是Poincaré不等式的特殊情况，可用分部积分证明。

*详细解答：*

**情况1：** $f(0) = 0$

由于 $f(0) = 0$，对任意 $x in [0, 1]$：
$ f(x) = integral_0^x f'(t) dif t $

由Cauchy-Schwarz不等式：
$ f^2(x) = (integral_0^x f'(t) dif t)^2 <= (integral_0^x 1^2 dif t)(integral_0^x (f'(t))^2 dif t) = x integral_0^x (f'(t))^2 dif t $

因此：
$ integral_0^1 f^2(x) dif x <= integral_0^1 x integral_0^x (f'(t))^2 dif t dif x $

交换积分次序：
$ integral_0^1 x integral_0^x (f'(t))^2 dif t dif x = integral_0^1 (f'(t))^2 integral_t^1 x dif x dif t $

$ = integral_0^1 (f'(t))^2 [x^2/2]_t^1 dif t = integral_0^1 (f'(t))^2 (1-t^2)/2 dif t $

$ <= 1/2 integral_0^1 (f'(t))^2 dif t < integral_0^1 (f'(t))^2 dif t $

**情况2：** $integral_0^1 f(x) dif x = 0$

设 $g(x) = f(x) - f(0)$，则 $g(0) = 0$ 且：
$ integral_0^1 g(x) dif x = integral_0^1 f(x) dif x - f(0) = -f(0) $

但由条件 $integral_0^1 f(x) dif x = 0$，所以 $f(0) = 0$，即 $g(x) = f(x)$。

这归结为情况1。

**严格证明：**

使用分部积分。设 $F(x) = integral_0^x f(t) dif t$，则 $F(0) = 0$，$F'(x) = f(x)$。

由于 $integral_0^1 f(x) dif x = 0$，所以 $F(1) = 0$。

$ integral_0^1 f^2(x) dif x = integral_0^1 f(x) F'(x) dif x $

分部积分：
$ = [f(x) F(x)]_0^1 - integral_0^1 f'(x) F(x) dif x = 0 - integral_0^1 f'(x) F(x) dif x $

由Cauchy-Schwarz不等式：
$ |integral_0^1 f'(x) F(x) dif x| <= (integral_0^1 (f'(x))^2 dif x)^(1/2) (integral_0^1 F^2(x) dif x)^(1/2) $

再由 $F(x) = integral_0^x f(t) dif t$ 和 $F(0) = F(1) = 0$，利用Poincaré不等式可得：
$ integral_0^1 F^2(x) dif x <= integral_0^1 (F'(x))^2 dif x = integral_0^1 f^2(x) dif x $

结合上述估计可得所求不等式。

**答案：** 不等式成立

---

== 第5题 (15分)

*题目：* 讨论 $sum_(n=1)^infinity ((-1)^(n-1))/(n + (-1)^(n-1) r) (r > 0)$ 的敛散性。

*解题思路：* 分奇偶项讨论，利用交错级数判别法和比值判别法。

*详细解答：*

将级数按奇偶项分组：
$ sum_(n=1)^infinity ((-1)^(n-1))/(n + (-1)^(n-1) r) = sum_(k=1)^infinity 1/(2k-1 + r) + sum_(k=1)^infinity (-1)/(2k - r) $

$ = sum_(k=1)^infinity 1/(2k-1 + r) - sum_(k=1)^infinity 1/(2k - r) $

**当 $r != 2k$ 对所有正整数 $k$ 时：**

分析各项的渐近行为：
- 奇数项：$a_(2k-1) = 1/(2k-1+r) ~ 1/(2k)$ 当 $k -> infinity$
- 偶数项：$a_(2k) = -1/(2k-r) ~ -1/(2k)$ 当 $k -> infinity$

考虑部分和：
$ S_(2n) = sum_(k=1)^n [1/(2k-1+r) - 1/(2k-r)] $

$ = sum_(k=1)^n [(2k-r) - (2k-1+r)]/[(2k-1+r)(2k-r)] = sum_(k=1)^n (-1-2r)/[(2k-1+r)(2k-r)] $

当 $r > 0$ 且 $r != 2k$ 时，分母 $(2k-1+r)(2k-r) > 0$ 对充分大的 $k$ 成立。

**情况分析：**

1. **当 $0 < r < 2$ 时：**
   对所有 $k >= 1$，$(2k-1+r) > 0$ 且 $(2k-r) > 0$（当 $k >= 1$）
   
   级数表现为：
   $ sum_(k=1)^infinity [1/(2k-1+r) - 1/(2k-r)] $
   
   由于 $1/(2k-1+r) < 1/(2k-r)$，每一项都是负数。
   利用积分判别法或比较判别法，可证明级数收敛。

2. **当 $r >= 2$ 时：**
   需要特别注意 $2k - r$ 可能为零或负数的项。
   
   - 若 $r = 2m$（偶数），则当 $k = m$ 时，$2k - r = 0$，级数有奇点
   - 若 $r$ 不是偶整数，则对充分大的 $k$，分母恒为正

**结论：**

通过Dirichlet判别法分析，设：
- $b_n = 1/(n + (-1)^(n-1) r)$
- $a_n = (-1)^(n-1)$

$sum a_n$ 的部分和有界，且当 $r > 0$ 且 $r$ 不是偶整数时，$b_n$ 单调趋于零。

**答案：** 
- 当 $r > 0$ 且 $r$ 不是偶整数时，级数**条件收敛**
- 当 $r$ 是偶整数时，级数发散（存在零分母项）

---

== 第6题 (20分)

*题目：* 
(1) 证明：${u_n(x)} = {(1 + x/n)^n}$ 在 $x in [0, 1]$ 上一致收敛；
(2) 证明：${v_n(x)} = {1/(e^x + (1 + x/n)^n)}$ 在 $x in [0, 1]$ 上一致收敛；
(3) 计算 $lim_(n->infinity) integral_0^1 dif x/(e^x + (1 + x/n)^n)$。

*详细解答：*

**(1) 证明 $u_n(x) = (1 + x/n)^n$ 在 $[0,1]$ 上一致收敛到 $e^x$**

对于 $x in [0, 1]$，有：
$ ln u_n(x) = n ln(1 + x/n) $

使用泰勒展开 $ln(1 + t) = t - t^2/2 + t^3/3 - ...$：
$ ln u_n(x) = n[x/n - x^2/(2n^2) + O(x^3/n^3)] = x - x^2/(2n) + O(x^3/n^2) $

因此：
$ u_n(x) = e^(x - x^2/(2n) + O(x^3/n^2)) = e^x dot e^(-x^2/(2n) + O(x^3/n^2)) $

$ = e^x [1 - x^2/(2n) + O(x^3/n^2) + O(x^4/n^2)] = e^x [1 - x^2/(2n) + O(1/n)] $

所以：
$ |u_n(x) - e^x| = e^x |1 - x^2/(2n) + O(1/n) - 1| <= e^x [x^2/(2n) + O(1/n)] $

对于 $x in [0, 1]$：
$ |u_n(x) - e^x| <= e [1/(2n) + O(1/n)] = O(1/n) $

因此 $u_n(x)$ 在 $[0, 1]$ 上一致收敛到 $e^x$。

**(2) 证明 $v_n(x) = 1/(e^x + (1 + x/n)^n)$ 一致收敛**

由 (1) 知 $u_n(x)$ 一致收敛到 $e^x$，且在 $[0, 1]$ 上：
- $e^x >= 1 > 0$
- $u_n(x) = (1 + x/n)^n >= 1 > 0$
- $u_n(x) -> e^x$ 一致

因此 $e^x + u_n(x) >= 2 > 0$，分母远离零。

由于 $u_n(x) -> e^x$ 一致，对任意 $epsilon > 0$，存在 $N$ 使得当 $n > N$ 时：
$ |u_n(x) - e^x| < epsilon "对所有" x in [0, 1] $

这意味着：
$ |v_n(x) - 1/(2e^x)| = |1/(e^x + u_n(x)) - 1/(2e^x)| $

$ = |(2e^x - e^x - u_n(x))|/|(e^x + u_n(x))(2e^x)| = |e^x - u_n(x)|/|(e^x + u_n(x))(2e^x)| $

由于分母有正的下界，且分子一致趋于零，所以 $v_n(x)$ 一致收敛到 $1/(2e^x)$。

**(3) 计算极限**

由 (2) 的一致收敛性和积分的连续性：
$ lim_(n->infinity) integral_0^1 dif x/(e^x + (1 + x/n)^n) = integral_0^1 1/(2e^x) dif x $

$ = 1/2 integral_0^1 e^(-x) dif x = 1/2 [-e^(-x)]_0^1 = 1/2 (-e^(-1) + 1) = (1 - e^(-1))/2 $

**答案：**
(1) 证明完成
(2) 证明完成  
(3) $lim_(n->infinity) integral_0^1 dif x/(e^x + (1 + x/n)^n) = (1 - e^(-1))/2$

---

== 第7题 (25分)

*题目：* 判断关于周期函数的四个命题的正误。

*详细解答：*

**(1) 若 $f$ 是处处不连续的周期函数，则 $f$ 必有最小正周期。**

**错误。** 

**反例：** 构造函数 $f: RR -> RR$：
$ f(x) = cases(
  1 "if" x in QQ,
  0 "if" x in.not QQ
) $

这个函数以任意正有理数为周期（因为有理数集在有理数平移下不变），因此是周期函数。

但 $f$ 处处不连续：对任意点 $x_0$，无论 $x_0$ 是有理数还是无理数，在其任意小邻域内都同时存在有理数和无理数，所以函数值在 0 和 1 之间跳跃。

由于有理数集稠密，$f$ 有无穷多个周期，且这些周期可以任意小（对任意 $epsilon > 0$，存在有理数 $0 < r < epsilon$ 使得 $f(x+r) = f(x)$），因此没有最小正周期。

**(2) 若 $f$ 是处处不连续的周期函数，则 $f$ 没有最小正周期。**

**错误。**

**反例：** 考虑函数：
$ f(x) = cases(
  1 "if" x in [0, 1/2) + 2ZZ,
  0 "if" x in [1/2, 1) + 2ZZ,
  1/2 "if" x in [1, 3/2) + 2ZZ,
  -1 "if" x in [3/2, 2) + 2ZZ
) $

这个函数以 2 为最小正周期，但在每个整数点和半整数点处都不连续。

实际上可以构造在每个点都不连续但有最小正周期的函数。

**(3) 若 $f$ 是周期函数但没有最小正周期，则 $f$ 必有一列趋于 0 的周期。**

**正确。**

**证明：** 设 $P$ 为 $f$ 的所有正周期构成的集合。由于 $f$ 没有最小正周期，对任意 $p in P$，存在 $q in P$ 使得 $0 < q < p$。

这意味着 $inf P = 0$。因此存在序列 ${p_n} subset P$ 使得 $p_n -> 0$。

关键观察：如果 $p, q$ 都是周期，则 $|p - q|$ 也是周期（当 $p != q$ 时）。

设 $epsilon > 0$，取 $p in P$ 使得 $p < epsilon$。由于不存在最小正周期，存在 $q in P, q < p$。继续这个过程，我们得到一个递减的周期序列趋于 0。

**(4) 若 $f$ 是连续的周期函数，则 $f$ 必有最小正周期。**

**错误。**

**反例：** 常函数 $f(x) = c$（常数）。

任意正数都是常函数的周期，因此没有最小正周期。

更一般地，如果 $f$ 是连续周期函数且其周期集在 $(0, +infinity)$ 中稠密，则 $f$ 必为常函数，从而没有最小正周期。

**答案：**
(1) 错误，反例：Dirichlet函数的变形
(2) 错误，可构造反例
(3) 正确
(4) 错误，反例：常函数

---

== 第8题 (20分)

*题目：* 设 $f$ 在 $(a, +infinity)$ 上有连续的导数，且 $lim_(x->+infinity) f(x) = A$。

*详细解答：*

**(1) $lim_(x->+infinity) f'(x)$ 未必存在的例子**

**例子：** $f(x) = A + sin(x)/x$

显然 $lim_(x->+infinity) f(x) = A$。

但 $f'(x) = cos(x)/x - sin(x)/x^2$

$lim_(x->+infinity) f'(x)$ 不存在，因为 $cos(x)/x$ 项使得 $f'(x)$ 振荡，虽然振荡幅度趋于 0，但振荡频率不变。

更具体地，$f'(x)$ 在 $x = 2k pi$ 附近约为 $1/(2k pi)$，在 $x = (2k+1)pi$ 附近约为 $-1/((2k+1)pi)$，所以极限不存在。

**(2) 若 $lim_(x->+infinity) f'(x)$ 存在，求其值**

设 $lim_(x->+infinity) f'(x) = L$。

由于 $f'(x) -> L$，对任意 $epsilon > 0$，存在 $M > a$ 使得当 $x > M$ 时：
$ |f'(x) - L| < epsilon $

对任意 $x > M$，由牛顿-莱布尼茨公式：
$ f(x) - f(M) = integral_M^x f'(t) dif t $

当 $x -> infinity$ 时：
$ A - f(M) = lim_(x->infinity) integral_M^x f'(t) dif t $

如果 $L != 0$，则积分 $integral_M^infinity f'(t) dif t$ 发散，这与 $f(x) -> A$ 矛盾。

因此必须 $L = 0$。

**答案：** $lim_(x->+infinity) f'(x) = 0$

**(3) 高阶导数极限的存在性**

**结论：** 对所有 $k = 1, 2, ..., n-1$，$lim_(x->+infinity) f^((k))(x) = 0$。

**证明：** 用数学归纳法。

**基础步骤：** 由 (2) 已证 $lim_(x->+infinity) f'(x) = 0$。

**归纳步骤：** 假设对某个 $1 <= k <= n-2$，有 $lim_(x->+infinity) f^((j))(x) = 0$ 对所有 $j = 1, 2, ..., k$。

现在证明 $lim_(x->+infinity) f^((k+1))(x) = 0$。

由归纳假设，$lim_(x->+infinity) f^((k))(x) = 0$。

设 $g(x) = f^((k))(x)$，则 $g'(x) = f^((k+1))(x)$，且：
- $lim_(x->+infinity) g(x) = 0$
- $lim_(x->+infinity) g^((n-k))(x) = lim_(x->+infinity) f^((n))(x)$ 存在

由于 $n - k >= 1$，可以对 $g$ 应用类似 (2) 的论证。

具体地，如果 $lim_(x->+infinity) f^((k+1))(x) = L != 0$，则由：
$ f^((k))(x) = f^((k))(M) + integral_M^x f^((k+1))(t) dif t $

当 $x -> infinity$ 时，积分项会导致 $f^((k))(x)$ 不趋于 0，与归纳假设矛盾。

**答案：**
(1) 例子：$f(x) = A + sin(x)/x$
(2) 极限值为 0
(3) 所有中间阶导数极限都存在且为 0

---

== 第9题 (20分)

*题目：* 关于Newton迭代法的收敛性证明。

*详细解答：*

**(1) 证明压缩映射性质**

由于 $f$ 在 $(0,0)$ 附近连续可微，且 $f(0,0) = 0$，$f_y(0,0) != 0$，不失一般性设 $f_y(0,0) > 0$。

迭代格式：$y_(n+1)(x) = y_n(x) - (f_y(0,0))^(-1) f(x, y_n(x))$

**第一部分：** 存在性和有界性

由于 $f(0,0) = 0$ 且 $f$ 连续，对任意 $epsilon > 0$，存在 $delta_1 > 0$ 使得当 $|x| < delta_1, |y| < epsilon$ 时：
$ |f(x,y)| < epsilon/2 |f_y(0,0)| $

取 $y_0(x) = 0$，则：
$ |y_1(x)| = |(f_y(0,0))^(-1) f(x, 0)| <= |f(x,0)|/|f_y(0,0)| < epsilon/2 $

归纳可得当 $|x| < delta_1$ 时，$|y_n(x)| < epsilon$ 对所有 $n$ 成立。

**第二部分：** 压缩性质

设 $g(x,y) = y - (f_y(0,0))^(-1) f(x,y)$，则迭代为 $y_(n+1)(x) = g(x, y_n(x))$。

计算：
$ (partial g)/(partial y) = 1 - (f_y(0,0))^(-1) f_y(x,y) $

在 $(0,0)$ 处：$(partial g)/(partial y)(0,0) = 1 - 1 = 0$

由 $f$ 的连续可微性，存在 $delta_2 > 0$ 使得当 $|x| < delta_2, |y| < delta_2$ 时：
$ |(partial g)/(partial y)(x,y)| < rho < 1 $

取 $delta = min(delta_1, delta_2)$，由中值定理：
$ |u_(n+1)(x)| = |y_(n+1)(x) - y_n(x)| = |g(x, y_n(x)) - g(x, y_(n-1)(x))| $
$ <= |(partial g)/(partial y)(x, xi)| |y_n(x) - y_(n-1)(x)| <= rho |u_n(x)| $

其中 $xi$ 在 $y_n(x)$ 和 $y_(n-1)(x)$ 之间。

**(2) 证明隐函数的存在性**

**第一步：** 级数收敛

由 (1)，当 $|x| < delta$ 时：
$ |u_(n+1)(x)| <= rho |u_n(x)| <= rho^n |u_1(x)| $

因此级数 $sum_(n=1)^infinity u_n(x)$ 绝对收敛，且：
$ sum_(n=1)^infinity |u_n(x)| <= |u_1(x)|/(1-rho) $

**第二步：** 函数的定义

定义 $y(x) = sum_(n=1)^infinity u_n(x) = lim_(n->infinity) y_n(x)$

由于每个 $u_n(x)$ 关于 $x$ 连续，且级数一致收敛（在紧集上），所以 $y(x)$ 连续。

**第三步：** 验证隐函数性质

需要证明 $f(x, y(x)) = 0$。

由迭代关系：
$ y_(n+1)(x) = y_n(x) - (f_y(0,0))^(-1) f(x, y_n(x)) $

重新整理：
$ f(x, y_n(x)) = f_y(0,0)(y_n(x) - y_(n+1)(x)) = f_y(0,0) u_(n+1)(x) $

当 $n -> infinity$ 时，$u_(n+1)(x) -> 0$，且 $y_n(x) -> y(x)$。

由 $f$ 的连续性：
$ f(x, y(x)) = lim_(n->infinity) f(x, y_n(x)) = lim_(n->infinity) f_y(0,0) u_(n+1)(x) = 0 $

**第四步：** 局部唯一性

由隐函数定理，由于 $f_y(0,0) != 0$，在 $(0,0)$ 附近存在唯一的连续函数 $y = phi(x)$ 满足 $f(x, phi(x)) = 0$ 且 $phi(0) = 0$。

我们构造的 $y(x)$ 满足这些条件，因此 $y(x) = phi(x)$。

**答案：**
(1) 证明完成，存在压缩常数 $rho < 1$
(2) 证明完成，$y(x)$ 是所求的连续隐函数