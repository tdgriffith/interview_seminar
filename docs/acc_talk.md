<!-- .slide: data-background="#003C71" class="dark" -->

# Adaptive Control is Not Complicated

## T. Griffith, Ph.D
#### Seminar Interview

#### July 30, 2022

---

<!-- .slide: data-background="#ffffff" class="light" -->
# ***Outline***

### 1. Why Study Adaptive Control?
### 2. Augmentation Example
### 3. Adaptive Control is Not Complicated
### 4. Adaptive Unknown Input Estimators
### 5. Some Applications of Note
### 6. Open Problems
### 7. Conclusions 


---
<!-- .slide: data-background="#003C71" class="dark" -->

# Why Study Adaptive Control?



---

<section>
<h1> Why Study Adaptive Control? </h1>
<h2> Some perspectives </h2>
<style>
.vertical-center {
  min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
  min-height: 100vh; /* These two lines are counted as one :-)       */

  display: flex;
  align-items: center;
}

.container{
    display: flex;
}
.col{
    flex: 1;
}
</style>

<div class="container vertical-center">

<div class="col">

<ul style="font-size:1.5vw">
<li style="padding-bottom:0.9em">Classical vs. stochastic vs. adaptive control </li>
<li style="padding-bottom:0.9em"> Flight and Space Structure Needs:</li>
<ul>
  <li style="padding-bottom:0.9em"> Operating in a poorly known environment</li>
  <li style="padding-bottom:0.9em"> Are experiments equivalent to actual operation?</li>
  <li style="padding-bottom:0.9em"> Many degrees of freedom</li>
  <li style="padding-bottom:0.9em"> Highly oscillatory</li>
  <li style="padding-bottom:0.9em"> Finite element models are only as good as the physics</li>
  <li style="padding-bottom:0.9em"> Changing situations: takeoff, deployment, landing</li>
  <li style="padding-bottom:0.9em"> Control schemes based on <strong><em>reduced order models</em></strong> </li>
  </ul>
  <li style="padding-bottom:0.9em"> Greatly emphasizes local vs. global, linear vs. nonlinear thinking</li>
</ul> 
</div>



<div class="col">

<figure>
  <img src="img/seminar/gambling.png" alt="Trulli" width="800">
  <figcaption> Gambling in function space from [<a href="https://ntrs.nasa.gov/citations/19900011756">1</a>].</figcaption>
</figure>



</div>
</div>
</section>

<section>
<h1> Why Study Adaptive Control? </h1>
<h2> Defining an adaptive system</h2>
<style>
.vertical-center {
  min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
  min-height: 100vh; /* These two lines are counted as one :-)       */

  display: flex;
  align-items: center;
}

.container{
    display: flex;
}
.col{
    flex: 1;
}
</style>

<div class="container vertical-center">

<div class="col">

<ul style="font-size:1.5vw">
<li style="padding-bottom:0.9em">Conceptually: </li>
<ul>
  <li style="padding-bottom:0.9em"> A system with knowledge of its performance and the potency to improve it.</li>
  </ul>
  <li style="padding-bottom:0.9em"> OR, more mathematically</li>
  <ul>
  <li style="padding-bottom:0.9em"> A map $\mathcal{J}$ from $\mathcal{S}_r$ to $\mathcal{P}$ ($\mathcal{J}: \mathcal{S}_r \rightarrow \mathcal{P}$) with range $\mathcal{J}(\mathcal{S}) \subseteq \mathcal{P}_A$</li>
  </ul>
  <li style="padding-bottom:0.9em">Remark: All systems are adaptive in this definition with respect to some $\mathcal{S}_r$ and $\mathcal{P}_A$  </li>
</ul> 
</div>



<div class="col">

<figure>
  <img src="img/seminar/aMAP.png" alt="Trulli" width="800">
  <figcaption>L. Zadeh, "Optimality and non-scalar-valued performance criteria [<a href="https://ieeexplore.ieee.org/abstract/document/1105511">2</a>].</figcaption>
</figure>



</div>
</div>
</section>


---
<!-- .slide: data-background="#003C71" class="dark" -->

# Augmentation example



---

<section>
<h1> Augmentation example </h1>
<h2> Recovering $\mathcal{P}_A$</h2>
<style>
.vertical-center {
  min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
  min-height: 100vh; /* These two lines are counted as one :-)       */

  display: flex;
  align-items: center;
}

.container{
    display: flex;
}
.col{
    flex: 1;
}
</style>

<div class="container vertical-center">

<div class="col">

<ul style="font-size:1.5vw">
<li style="padding-bottom:0.9em">Double integrator: </li>
<ul>
  <li style="padding-bottom:0.9em"> $\dot{x} = Ax+Bu, \ y=Cx$</li>
  <li style="padding-bottom:0.9em"> $A=\begin{bmatrix} 0 & 1 \\\ 0 & 0 \end{bmatrix}$, $B=\begin{bmatrix} 0 \\\ 1 \end{bmatrix}$, $C=\begin{bmatrix} 1 &1 \end{bmatrix}$</li>
  <li style="padding-bottom:0.9em"> Min. phase with $Z(A,B,C) = -1$</li>
  </ul>
  <li style="padding-bottom:0.9em"> Separation principle controller:</li>
  <ul>
  <li style="padding-bottom:0.9em"> $u = G\hat{x}$</li>
  <li style="padding-bottom:0.9em"> $\dot{\hat{x}}=A\hat{x} +Bu + K(y - \hat{y})$</li>
  <li style="padding-bottom:0.9em"> $\hat{y}=C \hat{x}$</li>
  </ul>
  <li style="padding-bottom:0.9em"> With set gains:</li>
  <ul>
  <li style="padding-bottom:0.9em"> $\sigma(A+BG) = -1 \pm j \Rightarrow G=\begin{bmatrix} -2 & -2 \end{bmatrix}$</li>
  <li style="padding-bottom:0.9em"> $\sigma(A-KC) = -2 \pm j \Rightarrow K=\begin{bmatrix} -1 & 5 \end{bmatrix}^T$</li>
  </ul>
</ul> 
</div>



<div class="col">

<figure>
  <img src="img/seminar/step_re.png" alt="Trulli" width="800">
  <figcaption>Separation principle controller is stable.</figcaption>
</figure>



</div>
</div>
</section>

<section>
<h1> Augmentation example </h1>
<h2> Recovering $\mathcal{P}_A$</h2>
<style>
.vertical-center {
  min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
  min-height: 100vh; /* These two lines are counted as one :-)       */

  display: flex;
  align-items: center;
}

.container{
    display: flex;
}
.col{
    flex: 1;
}
</style>

<div class="container vertical-center">

<div class="col">

<ul style="font-size:1.5vw">
<li style="padding-bottom:0.9em">But suppose $A$ became $\tilde{A}$:</li>
<ul>
  <li style="padding-bottom:0.9em"> $\dot{x} = \tilde{A}x+Bu, \ y=Cx$</li>
  <li style="padding-bottom:0.9em"> $\tilde{A}=\begin{bmatrix} 0 & 1 \\\ 0 & \color{red} 3 \end{bmatrix}$, $B=\begin{bmatrix} 0 \\\ 1 \end{bmatrix}$, $C=\begin{bmatrix} 1 &1 \end{bmatrix}$</li>
  <li style="padding-bottom:0.9em"> Min. phase with $Z(A,B,C) = -1$</li>
  </ul>
  <li style="padding-bottom:0.9em"> Separation principle controller:</li>
  <ul>
  <li style="padding-bottom:0.9em"> $u = G\hat{x}$</li>
  <li style="padding-bottom:0.9em"> $\dot{\hat{x}}=A\hat{x} +Bu + K(y - \hat{y})$</li>
  <li style="padding-bottom:0.9em"> $\hat{y}=C \hat{x}$</li>
  </ul>
  <li style="padding-bottom:0.9em"> With set gains:</li>
  <ul>
  <li style="padding-bottom:0.9em"> $\sigma(\tilde{A}+BG) = 0.5 \pm 1.3j \Rightarrow G=\begin{bmatrix} -2 & -2 \end{bmatrix}$</li>
  <li style="padding-bottom:0.9em"> $\sigma(\tilde{A}-KC) = -0.5 \pm 2.7j \Rightarrow K=\begin{bmatrix} 4 & 5 \end{bmatrix}^T$</li>
  </ul>
</ul> 
</div>



<div class="col">

<figure>
  <img src="img/seminar/step_re_pert.png" alt="Trulli" width="800">
  <figcaption>Perturbed separation principle controller is not stable.</figcaption>
</figure>



</div>
</div>
</section>

<section>
<h1> Augmentation example </h1>
<h2> Recovering $\mathcal{P}_A$</h2>
<style>
.vertical-center {
  min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
  min-height: 100vh; /* These two lines are counted as one :-)       */

  display: flex;
  align-items: center;
}

.container{
    display: flex;
}
.col{
    flex: 1;
}
</style>

<div class="container vertical-center">

<div class="col">

<ul style="font-size:1.5vw">
<li style="padding-bottom:0.9em">But suppose $A$ became $\tilde{A}$ and I have augmented the system with an adaptive outer loop:</li>
<ul>
  <li style="padding-bottom:0.9em"> $\dot{x} = \tilde{A}x+Bu, \ y=Cx$</li>
  <li style="padding-bottom:0.9em"> $\tilde{A}=\begin{bmatrix} 0 & 1 \\\ 0 & \color{red} 3 \end{bmatrix}$, $B=\begin{bmatrix} 0 \\\ 1 \end{bmatrix}$, $C=\begin{bmatrix} 1 &1 \end{bmatrix}$</li>
  <li style="padding-bottom:0.9em"> Min. phase with $Z(A,B,C) = -1$</li>
  </ul>
  <li style="padding-bottom:0.9em"> Adaptive separation principle controller:</li>
  <ul>
  <li style="padding-bottom:0.9em"> $u = G\hat{x} + G_A y$</li>
  <li style="padding-bottom:0.9em"> $\dot{\hat{x}}=A\hat{x} +Bu + K(y - \hat{y})$</li>
  <li style="padding-bottom:0.9em"> $\hat{y}=C \hat{x}$</li>
  </ul>
  <li style="padding-bottom:0.9em"> With same set gains and adaptive law:</li>
  <ul>
  <li style="padding-bottom:0.9em"> $\dot{G}_A = -y y^T \sigma, \ \sigma>0$</li>
  </ul>
</ul> 
</div>



<div class="col">

<figure>
  <img src="img/seminar/step_re_pert_adapt.png" alt="Trulli" width="800">
  <figcaption>Adaptive separation principle controller is stable.</figcaption>
</figure>



</div>
</div>
</section>

---

<!-- .slide: data-background="#003C71" class="dark" -->

# Adaptive Control is not Complicated



---



<section>
<h1> Adaptive Unknown Input Estimators </h1>
<h2> Estimator overview </h2>
<style>
.vertical-center {
  min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
  min-height: 100vh; /* These two lines are counted as one :-)       */

  display: flex;
  align-items: center;
}

.container{
    display: flex;
}
.col{
    flex: 1;
}
</style>

<div class="container vertical-center">

<div class="col">

<ul style="font-size:1.5vw">
<li style="padding-bottom:0.9em">Three significant uncertainties</li>
<ul>
  <li style="padding-bottom:0.9em"> Input $u$ is unknown, external, deterministic</li>
  <li style="padding-bottom:0.9em"> State matrix $A$ may have uncertainty</li>
  <li style="padding-bottom:0.9em"> Known, Lipschitz nonlinear internal dynamics $g(x)$</li>
  </ul>
<li ><strong><em>Can we synthesize $u$ and correct $A$?</em></strong></li>
</ul> 
</div>



<div class="col">

\begin{aligned}
    \dot{x}&=Ax+g(x)+Bu\\\
    y&=Cx
\end{aligned}



</div>
</div>
</section>


<section>
<h1> Adaptive Unknown Input Estimators </h1>
<h2> Modeling unknown inputs </h2>
<style>
.vertical-center {
  min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
  min-height: 100vh; /* These two lines are counted as one :-)       */

  display: flex;
  align-items: center;
}

.container{
    display: flex;
}
.col{
    flex: 1;
}
</style>

<div class="container vertical-center">

<div class="col">

<ul>
<li style="padding-bottom:0.9em">Approximate input space $\mathbb{U}$</li>
  <ul>
  <li style="padding-bottom:0.9em">$\hat{u}=\sum_{i=1}^{N} c_i f_i(t)$</li></ul>
<li style="padding-bottom:0.9em" style="padding-bottom:0.9em">Persistent Inputs</dt>
<ul>
  <li style="padding-bottom:0.9em">$\dot{z}_u=F_u z_u$</li>
  <li style="padding-bottom:0.9em">$\hat{u}=\Theta_u z_u$</li>
  <li style="padding-bottom:0.9em">$F_u = \begin{bmatrix} 0 & 1 & 0 \\\ -\omega^2 & 0 & 0 \\\ 0 & 0 & 0 \end{bmatrix}$</li>
  </ul>
</ul> 
</div>



<div class="col">

<figure>
  <img src="img/acc/uhat.gif" alt="Trulli" height="600">
</figure>


</div>
</div>

</section>

<section>
<h1> Adaptive Unknown Input Estimators </h1>
<h2> Architecture and estimator error </h2>
<style>
.vertical-center {
  min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
  min-height: 100vh; /* These two lines are counted as one :-)       */

  display: flex;
  align-items: center;
}

.container{
    display: flex;
}
.col{
    flex: 1;
}
</style>

<div class="container vertical-center">

<div class="col">

<figure>
  <img src="img/acc/adapt_est_weak.png" alt="Trulli" height="600">
</figure>
</div>



<div class="col">

Recover $A$ with adaptive scheme
`$$ A \equiv A_m +B L_{*} C $$`
`$$ \dot{L} = -e_y y^* \gamma_e; \ \gamma_e > 0 $$`
<br>
Error dynamics

`$$ \dot{e}=(\bar{A}+\bar{K} \bar{C})e+\bar{B} \Delta L y +\varepsilon \Delta g $$`

`$$ \begin{bmatrix} \dot{e}_x \\\ \dot{e}_z \end{bmatrix} = \underbrace{\begin{bmatrix} A_m+K_x C & B \Theta_u \\\ K_u C & F \end{bmatrix}}_\text{$\bar{A}_c$} \begin{bmatrix} e_x \\\ e_z \end{bmatrix} +\begin{bmatrix} B \\\ 0 \end{bmatrix} w +\varepsilon\begin{bmatrix} g(\hat{x})-g(x) \\\ 0 \end{bmatrix}$$`



</div>



</section>

<section>
<h1> Adaptive Unknown Input Estimators </h1>
<h2> Architecture and estimator error </h2>
<style>
.vertical-center {
  min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
  min-height: 100vh; /* These two lines are counted as one :-)       */

  display: flex;
  align-items: center;
}

.container{
    display: flex;
}
.col{
    flex: 1;
}
</style>

<div class="container vertical-center">

<div class="col">

 <ul>
  <li style="padding-bottom:0.5em">ASD plant dynamics</li>
<ul>
<li style="padding-bottom:0.5em">`$\bar{A}_c^* \bar{P} + \bar{P} \bar{A}_c = -\bar{Q}$`</li>
<li style="padding-bottom:0.5em">`$\bar{P}\bar{B}=\bar{C}^*$`</li>
</ul>
  <li style="padding-bottom:0.5em">$A$ Hurwitz</li>
  <li style="padding-bottom:0.5em">Bounded `$L_{*}$`</li>
  </ul>
</div>

<div class="col">
<ul>
 <li style="padding-bottom:0.5em">Error in state and input converges to zero
    <ul>
      <li style="padding-bottom:0.5em">`$V(e,\Delta L) = \frac{1}{2}e^*\bar{P}e+\frac{1}{2}\text{tr}(\Delta L \gamma_e^{-1} \Delta L^*)$`</li>
      <li style="padding-bottom:0.5em">`$\dot{V}(e, \Delta L)\leq -\Big(\underbrace{\frac{1}{2}\lambda_{\text{min}}(\bar{Q})-\varepsilon \mu\lambda_{\text{max}}(\bar{P})}_{\bar{\alpha}>0}\Big)||e||^2$`</li>
    </ul>
  </li>
</ul> 
<br>
<p> `\begin{align} 0<\varepsilon <\frac{\lambda_{\text{min}}(\bar{Q})}{2 \mu \lambda_{\text{max}}(\bar{P})}\Longleftrightarrow \bar{\alpha}>0. \end{align}`</p>



</div>





</section>

---


<!-- .slide: data-background="#ffffff" class="light" -->

<section>

<h1> Illustrative example</h1>
<style>
.vertical-center {
  min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
  min-height: 100vh; /* These two lines are counted as one :-)       */

  display: flex;
  align-items: center;
}

.container{
    display: flex;
}
.col{
    flex: 1;
}
</style>

<div class="container vertical-center">

<div class="col">
\begin{align}
\dot{x}&=A_m x+\varepsilon g(x)+Bu\\\
&=\begin{bmatrix}
-4 &1 &2\\\
-1 & -1 & 1\\\
-1 & 1 &-1 
\end{bmatrix}x+ \sin(x)+B u \\\
y&=Cx
\end{align}

</div>



<div class="col">
\begin{align}
\dot{x}&=A x+\varepsilon g(x)+Bu\\\
&=\begin{bmatrix}
-2.86 &1 &4.7\\\
1.8 & -1 & 6.7\\\
-9 & 1 &-1 7.2
\end{bmatrix}x+ \sin(x)+B u \\\
y&=Cx
\end{align}
<br>

</div>

</div>

<br>
`\begin{align}
L*=\begin{bmatrix}
-8 & 1\\\
2 & -7
\end{bmatrix}
\end{align}`


`\begin{align}
u_1(t)&=c_{11} \sin(2t)+ c_{12} \cos(2t) + c_{13} \sin(7t) + c_{14} \cos(7t)
\end{align}`
`\begin{align}
u_2(t)&=c_{11} +c_{22}t+c_{23}t^2+c_{24}t^3
\end{align}`

</section>



<section>

<h1> Illustrative example</h1>
<h3> Both the state error and the input error converge simultaneously </h3>
<style>
.vertical-center {
  min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
  min-height: 100vh; /* These two lines are counted as one :-)       */

  display: flex;
  align-items: center;
}

.container{
    display: flex;
}
.col{
    flex: 1;
}
</style>

<div class="container vertical-center">

<div class="col">
<figure>
  <img src="img/acc/ex_converge2.gif" alt="Trulli" height="500">
</figure>
</div>



<div class="col">
<figure>
  <img src="img/acc/eu_converge.gif" alt="Trulli" height="500">
</figure>

</div>

</div>

</section>

<section>

<h1> Illustrative example</h1>
<h3> provided $\epsilon$ is not too great </h3>
<p> `$0 < \epsilon < \frac{\lambda_{\min}(\bar{Q})}{2 \mu \lambda_{\max}(\bar{P})}$` </p>
<style>
.vertical-center {
  min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
  min-height: 100vh; /* These two lines are counted as one :-)       */

  display: flex;
  align-items: center;
}

.container{
    display: flex;
}
.col{
    flex: 1;
}
</style>

<div class="container vertical-center">

<div class="col">
<figure>
  <img src="img/acc/ex_sad_epsilon2.gif" alt="Trulli" height="500">
</figure>
</div>



<div class="col">
<figure>
  <img src="img/acc/eu_sad_epsilon3.gif" alt="Trulli" height="500">
</figure>

</div>

</div>

</section>

---

<section>

<h1> Application: Biomarker dynamics </h1>
<style>
.vertical-center {
  min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
  min-height: 100vh; /* These two lines are counted as one :-)       */

  display: flex;
  align-items: center;
}

.container{
    display: flex;
}
.col{
    flex: 1;
}
</style>

<div class="container vertical-center">

<div class="col">


<h3> Kalman filtering </h3>
<figure>
  <img src="img/acc/square_noL.gif" alt="Trulli" height="750">
</figure>

</div>



<div class="col">

<h3> aUIO  </h3>
<figure>
  <img src="img/acc/square_L.gif" alt="Trulli" height="750">
</figure>



</div>

</div>

</section>

---

<!-- .slide: data-background="#003C71" class="dark" -->


<h3>We lived in a sloppy world,  </h3>
<h2> ***but we were precise, very precise.*** </h2>
<br>
<div style="text-align: right"> <small>- Carrying the Fire</small></div>