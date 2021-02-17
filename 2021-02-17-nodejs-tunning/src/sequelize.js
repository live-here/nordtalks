const { Sequelize, DataTypes } = require('sequelize');

const sequelize = new Sequelize('postgres://postgres:password@localhost:5432/postgres', {
    dialect: 'postgres',
    dialectOptions: {
      application_name: 'thor',
      keepAlive: true,
    },
    quoteIdentifiers: false,
    benchmark: true,
    logging: true,
    pool: {
      handleDisconnects: true,
    },
    define: {
      freezeTableName: true,
    },
});

module.exports.Users = sequelize.define('Users', {
    id: { type: DataTypes.BIGINT, primaryKey: true },
    created_at: { type: DataTypes.TIME },
    updated_at: { type: DataTypes.TIME },
    name: { type: DataTypes.TEXT },
}, {
    tableName: 'users',
    timestamps: true,
    freezeTableName: true,
    underscored: true,
})

module.exports.Sequelize = async () => {
    await sequelize.authenticate();
    return sequelize;
}