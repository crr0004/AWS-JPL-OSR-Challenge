import tensorflow.compat.v1 as tf
tf.disable_eager_execution()
n = 2**12
dtype = tf.float32
matrix1 = tf.Variable(tf.ones((n, n), dtype=dtype))
matrix2 = tf.Variable(tf.ones((n, n), dtype=dtype))
product = tf.matmul(matrix1, matrix2)
with tf.Session() as session:
    session.run(tf.global_variables_initializer())
    session.run(product.op)
