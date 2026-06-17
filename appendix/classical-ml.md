# Classical Machine Learning

> Appendix · **Optional** — not required for Week 1 · [← Appendix](README.md) · Referenced from [AI vs ML](../week-01/theory/ai-vs-ml.md)

This page explains the **classical ML** algorithms mentioned in Week 1 theory: logistic regression, random forests, and gradient boosting (XGBoost, LightGBM). You need the *concepts* for architecture decisions — not hands-on training in Week 1.

---

## What is "classical" ML?

**Classical ML** here means traditional supervised learning on **structured (tabular) data** — rows of numbers, categories, and timestamps — using algorithms that predate the deep learning boom (~pre-2012) or evolved alongside it for tables.

```
Features (columns)  →  Model f(x)  →  Prediction (class or number)
```

Typical inputs: transaction amount, user tenure, device type, click count.  
Typical outputs: fraud / not fraud, churn probability, credit risk score.

**Why it still matters in 2026:** Tabular prediction is everywhere in production (fraud, ads, pricing, ops). These models are fast, cheap, interpretable, and often **beat LLMs** on structured tasks.

---

## Logistic regression

**What it does:** Predicts a **probability** (0–1) for a binary outcome — spam or not, default or not.

**How it works (intuition):** A weighted sum of features is passed through a sigmoid curve so the output stays between 0 and 1. Training adjusts weights to minimize prediction error on labeled examples.

**Strengths:**
- Simple, fast, well-understood
- Coefficients are interpretable ("each $100 increase in transaction amount raises fraud odds by X%")
- Strong baseline for tabular classification

**Weaknesses:**
- Assumes mostly linear relationships between features and log-odds (unless you engineer interactions)
- Weak on raw images, long text, or complex unstructured input

**AI engineer takeaway:** Reach for logistic regression (or a linear model) when you have clean tabular features and need auditability — not an LLM.

---

## Random forests

**What it does:** An **ensemble** of many decision trees, each trained on a random subset of data and features; predictions are averaged (regression) or voted (classification).

**How it works (intuition):** One decision tree asks yes/no questions ("Is amount > $500?"). A forest combines hundreds of trees to reduce overfitting and variance.

**Strengths:**
- Handles non-linear relationships and feature interactions
- Robust to outliers and mixed feature types
- Feature importance scores for explainability
- Little hyperparameter tuning needed to get a decent model

**Weaknesses:**
- Less interpretable than a single linear model
- Large models can be slow to serve at very high QPS (usually still fine vs LLMs)
- Not designed for sequences, images, or long documents

**AI engineer takeaway:** Strong default for tabular classification/regression when you want performance without neural-network complexity.

---

## Gradient boosting (XGBoost, LightGBM)

**What it does:** Builds an ensemble **sequentially** — each new tree corrects the errors of the previous ones. **XGBoost** and **LightGBM** are highly optimized implementations used heavily in industry and Kaggle-style competitions.

| Library | Notes |
|---------|-------|
| **XGBoost** | Mature, widely deployed; great docs and ecosystem |
| **LightGBM** | Often faster on large datasets; leaf-wise tree growth |
| **CatBoost** | Strong with high-cardinality categorical features (mentioned less in Week 1) |

**How it works (intuition):** Start with a weak prediction. Add a small tree that fits the **residuals** (what the model got wrong). Repeat. The final prediction is the sum of all trees.

**Strengths:**
- Often **state-of-the-art on tabular data**
- Handles missing values and mixed feature types well
- Fast inference (milliseconds) vs seconds for LLM calls
- Feature importance and SHAP values for explainability in regulated domains

**Weaknesses:**
- More hyperparameters than random forests (learning rate, depth, regularization)
- Can overfit small datasets without care
- Still wrong tool for open-ended language generation

**AI engineer takeaway:** When interviewers say "fraud detection" or "churn model," they often expect you to mention **gradient boosting on tabular features** before suggesting an LLM.

---

## Classical ML vs LLM (quick comparison)

| Dimension | Classical ML (XGBoost, etc.) | LLM |
|-----------|------------------------------|-----|
| **Best data** | Labeled tabular rows | Text, code, unstructured language |
| **Task** | Predict class or number | Generate, summarize, reason in language |
| **Cost at scale** | Very low per prediction | High per token |
| **Latency** | Milliseconds | Hundreds of ms to seconds |
| **Determinism** | Same input → same output | Stochastic (temperature > 0) |
| **Interpretability** | Feature importance, SHAP | Harder; needs evals and guardrails |
| **When labels are abundant** | Excellent | Often overkill |

From [AI vs ML](../week-01/theory/ai-vs-ml.md): use the decision flow — rules first, then classical ML for tabular + labels, then DL/LLM for unstructured or generative work.

---

## Explainability: SHAP (one paragraph)

**SHAP** (SHapley Additive exPlanations) assigns each feature a contribution to a single prediction — useful for "why was this transaction flagged?" in fraud reviews. You do not need to implement SHAP in Week 1; know that **classical ML + SHAP** is a standard answer when compliance asks for model explanations.

---

## Checkpoint (optional self-test)

1. What type of data is XGBoost best suited for?
2. Why might logistic regression be chosen over XGBoost in a regulated product?
3. Name one reason an LLM is a poor default for fraud scoring at 10M transactions/day.
4. What is the difference between random forests (parallel trees) and gradient boosting (sequential trees)?

---

## Go deeper — external resources

| Resource | Link | Why |
|----------|------|-----|
| StatQuest — ML playlist | https://www.youtube.com/playlist?list=PLblh5JKOoLUICTaGLRoHQDuV_1q_K_iji | Logistic regression, trees, forests explained simply |
| Google's ML Crash Course | https://developers.google.com/machine-learning/crash-course | Free structured foundations |
| XGBoost docs | https://xgboost.readthedocs.io/en/stable/ | Official implementation reference |
| LightGBM docs | https://lightgbm.readthedocs.io/en/latest/ | When you need speed on large tables |
| SHAP docs | https://shap.readthedocs.io/en/latest/ | Explainability for tree models |

---

## Back to Week 1

Continue the required path: [transformers.md](../week-01/theory/transformers.md) · [Lab 1](../week-01/labs/lab-01-tokenization.md)
